class PagesController < ApplicationController
  def home
    @products = Product.order("name").page(params[:page]).per(5)
  end
  def details
    @products = Product.find(params[:id])
  end
  def get_categories
    @categories = ProductCategory.all
  end

  def about

  end
  def contact

  end
end
