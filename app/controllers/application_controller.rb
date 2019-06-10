class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :set_order_items

  def parse_orders_input orders_input
    s1 = orders_input.split(/,/)
    arr = []
    s1.each do |x|
      s2 = x.split(/\=/)
      s3 = s2[0].split(/_/)
      id = s3[1]
      cnt = s2[1]
      arr2 = [id, cnt]
      arr.push arr2
    end
    arr
  end

  def get_session_params params
    @items = parse_orders_input(params)
    @items
  end

  def set_order_items
    items = get_session_params(session[:input_param])
    items.each do |item|
      item[0] = Product.find(item[0])
    end
  end
end
