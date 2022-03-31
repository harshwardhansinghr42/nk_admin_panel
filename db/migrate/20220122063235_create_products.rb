class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null:false
      t.integer :discount
      t.datetime :discount_expiry
      t.integer :status, default: 1
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, :name
  end
end
