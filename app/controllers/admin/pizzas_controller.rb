class Admin::PizzasController < AdminController
  def index
  end

  def new
    @pizza = Pizza.new
  end

  def create
    @pizza = Pizza.new
    @pizza.name = params[:pizza][:name]
    @pizza.doe_kind_id = params[:pizza][:doe_kind_id]
    @pizza.topping_ids = params[:pizza][:topping_ids]
    @pizza.save!
    params[:pizza][:images_attributes].each do |id, image|
      new_image = Image.new({order_num: image['order_num'], picture: image['picture']})
      @pizza.images << new_image
    end
    @pizza.save!
    redirect_to :action => "index", notice: "The new pizza has been added"
  end

  def edit
    @pizza = Pizza.find(params[:id])
  end

  def update
    @pizza = Pizza.find(params[:id])
    # @pizza.update_attributes(params[:pizza])
    @pizza.name = params[:pizza][:name]
    @pizza.doe_kind_id = params[:pizza][:doe_kind_id]
    @pizza.topping_ids = params[:pizza][:topping_ids]
    params[:pizza][:images_attributes].each do |id, image|
      if image['id'].present?
        curr_image = @pizza.images.find(image['id'])
        curr_image.order_num = image['order_num']
      end

      if image['picture'].present?
        new_image = Image.new({order_num: image['order_num'], picture: image['picture']})
        @pizza.images << new_image
      end
    end
    @pizza.save!
    redirect_to :action => "index", notice: "The pizza has been updated"
  end

  def destroy
    @pizza = Pizza.find(params[:id])
    @pizza.destroy
    redirect_to :action => "index", notice: "The pizza has been deleted"
  end
end
