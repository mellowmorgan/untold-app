class HomeController < ApplicationController
  include Devise::Controllers

  def index
    @request = Request.new
    @requests_published = Request.most_recently_added_published
    @requests_approved = Request.most_recently_added_approved
    render :index
  end
end