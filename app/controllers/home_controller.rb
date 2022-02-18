class HomeController < ApplicationController
  include Devise::Controllers
  before_action do
    if !current_user.admin
      flash[:alert] = "You are not authorized to access that feature."
    end
    
  end
  def index
    render :index
  end
end