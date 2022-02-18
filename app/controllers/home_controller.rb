class HomeController < ApplicationController
  include Devise::Controllers

  def index
    render :index
  end
end