class ProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = current_user.products.new(product_params)
    @product.save
  end

  private

  def product_params
    params.require(:product).permit(:name, :category_id, :calories_per_100)
  end
end
