class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.save
      get_session_params(session[:input_param])
      @items.each do |item|
        @order.order_items.create(product_id: item[0], product_count: item[1])
      end
      redirect_to order_placed_path
    else
      set_order_items
      @errors = @order.errors.full_messages
      render 'carts/show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:status_id, :name, :phone, :email, :address, :comment)
  end
end
