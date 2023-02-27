class Coupon < ApplicationRecord
    Stripe.api_key = Rails.application.credentials[:stripe][:secret]

    after_create do
        if amount_off > 0 
            coupon = Stripe::Coupon.create({
                amount_off: amount_off,
                currency: 'brl',
            })
        elsif
            coupon = Stripe::Coupon.create({
                percent_off: percent_off,
            })     
        end
        promotion_code = Stripe::PromotionCode.create({
            coupon: coupon.id,
            code: code
        })
        update(stripe_coupon_id: coupon.id, stripe_promotion_code: promotion_code.id)
    end
end