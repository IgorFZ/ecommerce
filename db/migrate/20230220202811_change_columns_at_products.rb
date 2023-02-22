class ChangeColumnsAtProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :stripe_price_id, :string, null: false
    change_column :products, :stripe_product_id, :string, null: false
  end
end
