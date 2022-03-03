class ApplicationController < ActionController::Base
  include Response
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:from_category]
  # skip_before_action :verify_authenticity_token
  
  protect_from_forgery with: :null_session
  # protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end
  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :unprocessable_entity)
  end

end

