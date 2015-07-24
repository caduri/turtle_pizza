class Admin::ToppingsController < ApplicationController
  def index
  end

  def new
    @topping = Topping.new
  end

  def create
    @topping = Topping.new
    @topping.name = params[:topping][:name]
    @topping.save
    redirect_to :action => "index", notics: "The doe kind has been added"
  end

  def edit
    @topping = Topping.find(params[:id])
  end

  def update
    @topping = Topping.find(params[:id])
    @topping.update_attributes(params[:topping])
    redirect_to :action => "index", notics: "The doe kind has been updated"
  end
end
