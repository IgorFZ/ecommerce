class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string "name", null: false
      t.text "desc", null: false
      t.integer "price", default: 0, null: false
      t.integer "stock", default: 0, null: false
      t.bigint "category_id", null: false
      t.string "brand", null: false
      t.integer "stars", default: 0, null: false
      t.index ["category_id"], name: "index_products_on_category_id"
      t.timestamps
    end
  end
end
