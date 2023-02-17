class Product < ApplicationRecord
    include Rails.application.routes.url_helpers
    
    has_many_attached :images

    def image_url
        arrayImg = [] 
        arrayImg = images.map do |img|
            Rails.application.routes.url_helpers.url_for(img)
        end
    end
end
