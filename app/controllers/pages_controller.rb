class PagesController < ApplicationController
  def home
    @products = Product.order("name").page(params[:page])
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
    @products = Product.where('product_category_id = ?', params[:id].to_i).page(params[:page])
  end

  def search_result
    unless(params[:search].blank?)

      wildcard_keywords = '%' + params[:search] + '%'

      if params[:category].to_i == 0
        @products = Product.where('name LIKE ? OR description LIKE ?', wildcard_keywords, wildcard_keywords).page(params[:page])
      else
        @products = Product.where('name LIKE ? OR description LIKE ?', wildcard_keywords, wildcard_keywords).where('product_category_id = ?', params[:category].to_i).page(params[:page])
      end
    end
  end

  def new_product
    @products = Product.where("created_at >= ?", 2.days.ago.utc).order(:created_at).page(params[:page])
  end

  def updated_product
    @products = Product.where("updated_at >= ?", 2.days.ago.utc).order(:updated_at).page(params[:page])
  end

end
