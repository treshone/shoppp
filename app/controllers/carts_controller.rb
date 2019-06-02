class CartsController < ApplicationController
  def show
    @orders_input = session[:input_param]
    @items = parse_orders_input @orders_input
    @items.each do |item|
      item[0] = Product.find(item[0])
    end
  end

  def create
    session[:input_param] = params[:orders_input]
    redirect_to cart_show_path
  end
end
