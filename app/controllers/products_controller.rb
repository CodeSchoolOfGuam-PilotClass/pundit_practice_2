class ProductsController < ApplicationController
  before_action :authorize_request
  def index
    products = Product.all
    render json: products
  end
end
