class AddAddressLineToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :address_line, :string
  end
end
