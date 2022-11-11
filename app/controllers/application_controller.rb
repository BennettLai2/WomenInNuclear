class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :success
    respond_to :html, :json
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected 
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :admin, :points])
            devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :admin, :points])
        end
end