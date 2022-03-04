class RequestsController < ApplicationController
  include Devise::Controllers
  def open
    @requests_approved = Request.most_recently_added_approved
    render :open
  end
  def answered
    @requests_published = Request.most_recently_added_published
    render :answered
  end
end