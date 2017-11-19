class Address < ApplicationRecord
  belongs_to :user
  validates :bCountry, :bProvince, :bPostalCode, :bCity, :bPhone, presence: true
  has_one :address_type
  belongs_to :province
end
