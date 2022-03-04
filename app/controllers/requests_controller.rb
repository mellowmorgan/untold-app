class RequestsController < ApplicationController
  include Devise::Controllers
  def from_open_category
    clicked_category=params[:category]
    query = "select * from requests where '#{clicked_category}'=ANY(categories) AND status='approved';"
    result = ActiveRecord::Base.connection.execute(query)
    @requests_published = helper_values(result.values)
    respond_to do |format|
      format.js {render layout: false}
    end
  end
  def from_answered_category
    clicked_category=params[:category]
    query = "select * from requests where '#{clicked_category}'=ANY(categories) AND status='published';"
    result = ActiveRecord::Base.connection.execute(query)
    @requests_published = helper_values(result.values)
    respond_to do |format|
      format.js {render layout: false}
    end
  end
  def open
    @requests_approved = Request.most_recently_added_approved
    render :open
  end
  def answered
    @requests_published = Request.most_recently_added_published
    render :answered
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