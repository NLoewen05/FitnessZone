class ProductsController < ApplicationController

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :weight, :description, :price, :caption)
  end
end
