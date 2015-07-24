class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update_attributes(params[:order])
    redirect_to root_url, notice: "Your order has been made"
  end

  def create
    @pizza = Pizza.find(params[:pizza_id])
    @order = Order.new
    @order.pizza_id = @pizza._id
    @order.doe_kind_id = @pizza.doe_kind_id
    @order.topping_ids = @pizza.topping_ids
    @order.save
    redirect_to :action => "show", :id => @order._id
  end
end
