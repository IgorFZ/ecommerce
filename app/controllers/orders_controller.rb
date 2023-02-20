class OrdersController < ApplicationController
    #before_action :authenticate_user!

    def add_to_cart
        if Order.exists?(user_id: params[:user_id]) && (Order.where(status: 'cart').find_by(user_id: params['user_id'])).present?
            order = Order.where(status: 'cart').find_by(user_id: params['user_id'])
            product = Product.find(params[:product_id])
            quantity = params[:quantity]
            total = (quantity.to_i * product.price.to_i)

            order_items = OrderItem.create(order_id: order.id, product_id: product.id, quantity: quantity)
            Order.update(total: order.total + total)
            
            render json: {
                message: "Order Updated",
            }, status: :ok
        else
            product = Product.find(params[:product_id])
            quantity = params[:quantity]
            total = (quantity.to_i * product.price.to_i)

            order = Order.create(user_id: params[:user_id], status: "cart", total: total)
            order_items = OrderItem.create(order_id: order.id, product_id: product.id, quantity: quantity)
            render json: {
                message: "Order Created",
                order: order,
                order_items: order_items,
            }, status: :ok
        end 
    end

    def get_user_cart
        if Order.exists?(user_id: params[:user_id]) && (Order.where(status: 'cart').find_by(user_id: params['user_id'])).present?
            order = Order.where(status: 'cart').find_by(user_id: params['user_id'])
            order_items = OrderItem.where(order_id: order.id)
            x = 0
            product = Array.new
            order_items.each { |order_item|
                product[x] = @product = ProductSerializer.new(Product.find(order_item.product_id)).serializable_hash[:data][:attributes]
                x += 1
            }
            render json: {
                message: "Cart",
                order: order,
                order_items: order_items,
                product: product,
            }, status: :ok
        else
            render json: {
                message: "No products at cart",
            }, status: :ok
        end 
    end

    private

        # Use callbacks to share common setup or constraints between actions.
        def set_order
            order = Order.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def order_params
            params.require(:order).permit(:user_id, :status, :total)
        end

  end