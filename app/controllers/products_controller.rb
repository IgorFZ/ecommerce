class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  def index
    @products = Product.all.limit(params[:limit])
    @products = @products.where('name ilike ?', "%#{params[:name]}%") if params[:name].present?
    @products = @products.order("#{params[:mode]}": :"#{params[:direction]}") if params[:mode].present?
  
    @products = @products.map { |product| 
      product = ProductSerializer.new(product).serializable_hash[:data][:attributes]
    }
    render json: @products
  end

  # GET /products/1
  def show
    @product = ProductSerializer.new(@product).serializable_hash[:data][:attributes]
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :desc, :price, :stars, :brand, :stock, :images)
    end
end
