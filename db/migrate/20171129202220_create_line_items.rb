class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.float :price
      t.integer :quantity
      t.belongs_to :product, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.timestamps
    end
  end
end
