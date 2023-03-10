class ApplicationController < ActionController::API
    respond_to :json
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name)}
    end
end
