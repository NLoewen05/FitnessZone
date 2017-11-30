class ChangeAddressTypeColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :address_types, :type, :name
  end
end
