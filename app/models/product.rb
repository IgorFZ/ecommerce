class Product < ApplicationRecord
    include Rails.application.routes.url_helpers

    Stripe.api_key = Rails.application.credentials[:stripe][:secret]

    validates :name, :price, presence: true
    has_many_attached :images
    belongs_to :order_items

    def image_url
        arrayImg = [] 
        arrayImg = images.map do |img|
            Rails.application.routes.url_helpers.url_for(img)
        end
    end

    def to_s
        name
    end
    
    after_create do
        product = Stripe::Product.create(name: name)
        product_price = Stripe::Price.create({
            unit_amount: price,
            currency: 'brl',
            product: product.id,
        })
        update(stripe_price_id: product_price.id, stripe_product_id: product.id)
    end
end
