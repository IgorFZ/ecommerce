class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code, null: false
      t.string :stripe_coupon_id
      t.timestamps
    end
  end
end
