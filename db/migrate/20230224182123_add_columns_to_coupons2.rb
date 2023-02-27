class AddColumnsToCoupons2 < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :stripe_promotion_code, :string
  end
end
