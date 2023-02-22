class ChangeColumnsAtProducts3 < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :stripe_price_id, :string
    change_column :products, :stripe_product_id, :string
  end
end
