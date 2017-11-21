class PagesController < ApplicationController
  def home
    @products = Product.order("name").page(params[:page]).per(12)
  end
  def details
    @products = Product.find(params[:id])
  end
  def about
    @about = About.first
  end
  def contact
    @contact = Contact.first
  end
  def categories
    @products = Product.where('product_category_id = ?', params[:id].to_i).page(params[:page]).per(12)
  end
  def search_result
     wildcard_keywords = '%' + params[:search] + '%'

    if params[:category].to_i == 0
      @products = Product.where('name LIKE ? OR description LIKE ?', wildcard_keywords, wildcard_keywords)
    else
      @products = Product.where('name LIKE ? OR description LIKE ?', wildcard_keywords, wildcard_keywords).where('product_category_id = ?', params[:category].to_i)
    end
  end
end
