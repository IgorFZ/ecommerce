class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer "user_id", null: false
      t.string "status", null: false
      t.integer "total", null: false
      t.index ["user_id"], name: "index_orders_on_user_id"
      t.timestamps
    end
  end
end
