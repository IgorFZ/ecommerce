class MembersController < ApplicationController
    before_action :authenticate_user!

    def show
        user = get_user_from_token
        if (user == null || user == 'undefined')
            render json: {
                message: "Something went wrong",
                user: user
            }, status: :unprocessable_entity
        else 
            render json: {
                message: "If you see this, you're in!",
                user: user
            }, status: :ok
        end
    end
  
    private
  
    def get_user_from_token
        token = request.headers['Authorization'].split(' ')[1]
        key = Rails.application.credentials.devise[:jwt_secret_key]
        jwt_payload = JWT.decode(token, key)
        user_id = jwt_payload[0]['sub']
        User.find(user_id.to_s)
    end
end