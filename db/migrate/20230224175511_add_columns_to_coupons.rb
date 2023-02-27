class AddColumnsToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :amount_off, :integer, null: false, default: 0
    add_column :coupons, :percent_off, :decimal, null: false, default: 0, precision: 7, scale: 2
  end
end
