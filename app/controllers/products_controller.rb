class ProductsController < ApplicationController
  before_action :authorize_request
  def index
    products = policy_scope(Product)
    render json: products
  end

  def show
    product = Product.find(params[:id])
    authorize product
    render json: product
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      published: false,
      user_id: @current_user.id
    )
    authorize product
    product.save
    render json: product
  end

  def update

  end

  def destroy
    
  end
end
