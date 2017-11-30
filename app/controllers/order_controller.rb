class OrderController < ApplicationController

  def index
    @products_in_cart = Product.find(session[:shopping_cart].keys)
    session[:cart_subtotal] = 0;

    @products_in_cart = []

    session[:shopping_cart].each do |product, quantity|
      price = Product.find(product).price
      image = Product.find(product).image
      cart_item = CartItem.new(product, quantity, image, price)
      session[:cart_subtotal] += cart_item.quantity * cart_item.price
      @products_in_cart << cart_item
    end

    @cart_subtotal = session[:cart_subtotal]
  end

  def add_to_cart

    product = Product.find(params[:id])

    session[:shopping_cart][product.id] ||= 0
    session[:shopping_cart][product.id] += 1

    redirect_to home_url
  end

  def increase_item_quantity
    session[:shopping_cart][params[:id]] += 1
    redirect_to shopping_cart_url
  end

  def decrease_item_quantity
    session[:shopping_cart][params[:id]] -= 1

    if session[:shopping_cart][params[:id]] == 0
      remove_from_cart
    else
      redirect_to shopping_cart_url
    end

  end

  def remove_all_from_cart
    session[:shopping_cart] = {}
    redirect_to shopping_cart_url
  end

  def remove_from_cart
    session[:shopping_cart].except!(params[:id])
    redirect_to shopping_cart_url
  end


  class CartItem
    attr_accessor :id, :quantity, :name, :image, :price

    def initialize(id, quantity, image, price)
        @id = id
        @quantity = quantity
        @name = Product.find(id).name
        @image = Product.find(id).image
        @price = price
    end

  end

  def check_customer
    if !user_signed_in? || current_user == nil
      redirect_to new_user_registration_path
    else
      redirect_to check_out_url
    end
  end

  def check_out
    user = User.find(current_user.id)
    order = user.orders.new
    session[:shopping_cart].each do |product, quantity|
      price = Product.find(product).price
      prod = Product.find(product)
      order.line_items.build(product: prod, price: price, quantity: quantity)
    end
    order.save
    redirect_to home_url, notice: "Order Submitted Succesfully"
  end
end
