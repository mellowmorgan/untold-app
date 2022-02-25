class HomeController < ApplicationController
  include Devise::Controllers

  def index
    @requests_published = Request.most_recently_added_published
    render :index
  end
end