class CreateProductComments < ActiveRecord::Migration[7.0]
  def change
    create_table :product_comments do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :comment, null: false

      t.timestamps
    end
  end
end
