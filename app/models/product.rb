class Product < ApplicationRecord
  belongs_to :product_category
  has_many :line_items

  validates :name, :weight, :price, :description, :caption, presence: true

  has_attached_file :image, styles: { small: "200x200>", med: "300x300>", large: "1024x1024>" }

  validates_attachment_file_name :image, :matches => [/\.(gif|jpg|jpeg|tiff|png)$/]
  validates_uniqueness_of :image_file_name # this is a standard ActiveRecord validator


  paginates_per 10

end
