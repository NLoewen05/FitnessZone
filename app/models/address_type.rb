class AddressType < ApplicationRecord
  validates :type, presence: true
  belongs_to :address
end
