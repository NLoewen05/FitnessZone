class Order < ApplicationRecord
  belongs_to :user
  has_many :products
  validates :quantity, :status, :gst, :pst, :price, :totalPrice, presence: true
end
