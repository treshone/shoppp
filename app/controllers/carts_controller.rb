class CartsController < ApplicationController
  def show
    set_order_items
  end

  def create
    session[:input_param] = params[:orders_input]
    redirect_to cart_show_path
  end

  def order_placed
  end
end
