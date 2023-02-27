class ChangeColumnsAtProducts4 < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :stripe_price_id, :string, null: true
    change_column :products, :stripe_product_id, :string, null: true
  end
end
