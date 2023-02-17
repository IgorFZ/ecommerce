class ProductSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :desc, :price, :stock, :stars, :brand, :category_id, :images, :created_at, :updated_at, :image_url
  end