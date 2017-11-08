class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :weight
      t.decimal :price
      t.text :description
      t.string :caption


      t.timestamps
    end
  end
end

