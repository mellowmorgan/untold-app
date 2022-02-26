class HomeController < ApplicationController
  include Devise::Controllers

  def index
    @requests_published_10 = Request.most_recently_added_published
    @requests_approved_10 = Request.most_recently_added_approved
    render :index
  end
end