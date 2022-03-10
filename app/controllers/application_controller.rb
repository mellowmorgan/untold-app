class ApplicationController < ActionController::Base
  include Response
  before_action :authenticate_user!
  # skip_before_action :authenticate_user!, :only => [:from_category]
  # skip_before_action :verify_authenticity_token
  
  protect_from_forgery with: :null_session
  # protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end
  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :unprocessable_entity)
  end
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
  end
end

