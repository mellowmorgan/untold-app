require('pry')
class HomeController < ApplicationController
  include Devise::Controllers
  def from_category 
    clicked_category=params[:category]
    query = "select * from requests where '#{clicked_category}'=ANY(categories) AND status='published';"
    result = ActiveRecord::Base.connection.execute(query)
    @requests_published = helper_values(result.values)
    # binding.pry
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def index
    @request = Request.new
    @requests_published = Request.most_recently_added_published
    @requests_approved = Request.most_recently_added_approved
    render :index
  end

  def helper_values(requests)
    new_array = []
    requests.each do |entry|
      obj=Request.new(id:entry[0], content:entry[1], status:entry[2], user_id:entry[3],created_at:entry[4],updated_at:entry[5],categories:entry[6])
      new_array.push(obj)
    end
    new_array
  end
end



