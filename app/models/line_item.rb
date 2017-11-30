class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :price, :quantity, presence: true
end
