require('pry')
class RequestsController < ApplicationController
  include Devise::Controllers
  def from_open_category
    clicked_category=params[:category]
    query = "select * from requests where '#{clicked_category}'=ANY(categories) AND status='approved';"
    result = ActiveRecord::Base.connection.execute(query)
    @requests_approved = helper_values(result.values)
    # binding.pry
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
  def add_request
    if request_params["categories"]
      str_categories = request_params["categories"]
      array_categories = str_categories.gsub(/\s+/, "").split(",")
    end 
    request = Request.new(status:request_params["status"],user_id:request_params["user_id"],content: request_params["content"],categories: array_categories)
    if request.save
      @requests_approved = Request.most_recently_added_all_approved.paginate(page: params[:page], per_page: 10)
      flash[:notice] = "Your request has been added."
      redirect_to '/requests/open'
    else
      errors = ""
      if request.errors.any?
        errors = request.errors.full_messages.join(", ")
      end
      flash[:alert] = "There was an error adding your request. #{errors}."
      redirect_to '/requests/open'
    end
  end
  def open
    @requests_approved = Request.most_recently_added_all_approved.paginate(page: params[:page], per_page: 10)
    render :open
  end
  def answered
    @requests_published = Request.most_recently_added_all_published.paginate(page: params[:page], per_page: 10)
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
  private
  def request_params
    params.permit(:user_id, :content,:status,:categories)
  end
end