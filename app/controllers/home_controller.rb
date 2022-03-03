require('pry')
class HomeController < ApplicationController
  include Devise::Controllers


  def index
    @request = Request.new
    @requests_published = Request.most_recently_added_published
    @requests_approved = Request.most_recently_added_approved
    render :index
  end
end
def from_category 
  binding.pry
  clicked_category=params[:category]
  query = "select * from requests where '#{clicked_category}'=ANY(categories) AND status='published';"
  result =ActiveRecord::Base.connection.execute(query)
  @requests_published = result.values
  respond_to do |format|
    format.js
  end

end

