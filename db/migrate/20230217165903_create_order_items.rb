class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer "order_id"
      t.integer "product_id"
      t.integer "quantity"
      t.index ["order_id"], name: "index_order_items_on_order_id"
      t.index ["product_id"], name: "index_order_items_on_product_id"
      t.timestamps
    end
  end
end
