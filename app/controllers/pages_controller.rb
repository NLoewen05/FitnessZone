class PagesController < ApplicationController
  def home
    @products = Product.order("name").page(params[:page]).per()
  end
  def details
    @products = Product.find(params[:id])
  end
  def about
    @about = About.all.first
  end
  def contact
    @contact = Contact.all.first
  end
end
