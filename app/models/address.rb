class Address < ApplicationRecord
  validates :country, :province_id, :postalCode, :city, :phone, :address_line, presence: true
  belongs_to :address_type
  belongs_to :user
  belongs_to :province
end
