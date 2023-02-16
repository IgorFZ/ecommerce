class Post < ApplicationRecord
    has_one_attached :image

    # validates :image, file_size: { less_than_or_equal_to: 5.megabytes },
    #           file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }

    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end
end
