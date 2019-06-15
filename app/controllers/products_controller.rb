class ProductsController < ApplicationController
  def index
    if params[:category]
      @products = Product.where(category: params[:category], is_active: true).all
    else
      @products = Product.where(category_id: 1, is_active: true)
    end
  end
end
