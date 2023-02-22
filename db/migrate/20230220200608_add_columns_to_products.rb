class AddColumnsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :stripe_price_id, :string, null: false
    add_column :products, :stripe_product_id, :string, null: false
  end
end
