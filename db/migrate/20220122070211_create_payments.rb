class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :pay_id, null: false
      t.string :signature, null: false
      t.boolean :verified, default: false
      t.string :order_id, null: false

      t.timestamps
    end
  end
end
