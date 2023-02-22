class CheckoutController < ApplicationController

    Stripe.api_key = Rails.application.credentials[:stripe][:secret]
    YOUR_DOMAIN = 'http://localhost:5173/'

    def new
        if Order.exists?(user_id: current_user.id) && (Order.where(status: 'cart').find_by(user_id: current_user.id)).present?
            order = Order.where(status: 'cart').find_by(user_id: current_user.id)
            order_items = OrderItem.where(order_id: order.id)
            x = 0
            items = {}
            order_items.each { |order_item|
                product = Product.find(order_item.product_id)
                items[x] = {price: product[:stripe_price_id], quantity: order_item[:quantity]}
                x += 1
            }

            @stripe_checkout_session = Stripe::Checkout::Session.create(
                customer: current_user.stripe_customer_id,
                payment_method_types: ['card'],
                allow_promotion_codes: true,
                line_items: items,
                mode: 'payment',
                success_url: YOUR_DOMAIN,
                cancel_url: YOUR_DOMAIN + 'cart',
            )

            if ((@stripe_checkout_session.status) == "open")
                render json: {
                    message: "If you see this, you're in!",
                    url: @stripe_checkout_session.url,
                    product: items
                }, status: :ok
            else
                render json: {
                    message: "Not working!",
                    url: @stripe_checkout_session.cancel_url,
                    product: items
                }, status: :ok
            end
        else
            render json: {
                message: "No products at cart",
            }, status: :ok
        end 
    end
    
    def create
        redirect_to checkout_success_path
    end
    
    def success

    end
    
    def cancel
    end
    
     private
    
    def checkout_success_url
        # url_for(action: 'success', only_path: false, session_id: params[:session_id])
    end
    
    def checkout_cancel_url
        # url_for(action: 'cancel', only_path: false)
    end

    def get_user_from_token
        token = request.headers['Authorization'].split(' ')[1]
        key = Rails.application.credentials.devise[:jwt_secret_key]
        jwt_payload = JWT.decode(token, key)
        user_id = jwt_payload[0]['sub']
        User.find(user_id.to_s)
    end

end