class CreateOrderStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :order_statuses do |t|
      t.string :order_id, null: false
      t.integer :status, default: 0
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
