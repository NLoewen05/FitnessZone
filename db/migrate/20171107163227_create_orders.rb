class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal :quantity
      t.string :status
      t.decimal :gst
      t.decimal :pst
      t.float :price
      t.float :totalPrice

      t.timestamps
    end
  end
end
