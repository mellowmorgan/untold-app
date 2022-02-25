class ApplicationController < ActionController::Base
  include Response
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  protect_from_forgery with: :null_session
  # protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end
  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :unprocessable_entity)
  end
end

