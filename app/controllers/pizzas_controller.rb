class PizzasController < ApplicationController
  def index
  end

  def show
    @pizza = Pizza.find(params[:id])
  end
end
