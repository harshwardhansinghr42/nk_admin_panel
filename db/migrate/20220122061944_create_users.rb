class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :phone, null: false
      t.string :email
      t.string :name
      t.string :otp
      t.datetime :otp_created_at
      t.datetime :otp_confirmed_at
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :users, :phone, unique: true
  end
end
