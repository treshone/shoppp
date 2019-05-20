class ProductsController < ApplicationController
  def index
    if params[:category]
      @products = Product.where(category: params[:category]).all
    else
      @products = Product.where(category_id: 1)
    end
  end
end
