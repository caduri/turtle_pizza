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
    @pizza.save
    @pizza.images.create([{order_num: 1, remote_picture_url: 'app/assets/images/pizza1.jpeg'}, {order_num: 2, remote_picture_url: 'app/assets/images/pizza2.jpeg'}, {order_num: 3, remote_picture_url: 'app/assets/images/pizza3.jpeg'}])
    redirect_to :action => "index", notice: "The new pizza has been added"
  end

  def edit
    @pizza = Pizza.find(params[:id])
  end

  def update
    @pizza = Pizza.find(params[:id])
    @pizza.update_attributes(params[:pizza])
    redirect_to :action => "index", notics: "The pizza has been updated"
  end

  def destroy
    @pizza = Pizza.find(params[:id])
    @pizza.destroy
    redirect_to :action => "index", notics: "The pizza has been deleted"
  end
end
