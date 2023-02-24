class ProductSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :price, :brand, :category_id, :images, :image_url
  end