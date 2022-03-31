class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :full_name
      t.string :phone
      t.string :pin_code
      t.string :house_no
      t.string :landmark
      t.string :city
      t.string :state
      t.boolean :default, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
