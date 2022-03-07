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

  def add_description
    # binding.pry
    if Description.create!(description_params)
      request = Request.find(params[:request_id])
      request.update(status="published")
      flash[:notice] = "Your description has been added."
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "There was an error adding your description."
      redirect_back(fallback_location: root_path)
    end
  end

  def add_request
    # binding.pry
    if request_params["categories"]
      str_categories = request_params["categories"]
      array_categories = str_categories.gsub(/\s+/, "").split(",")

      request = Request.new(status:request_params["status"],user_id:request_params["user_id"],content: request_params["content"],categories: array_categories)
    else 
      request_strong_params["categories"]
      str_categories = request_strong_params["categories"]
      array_categories = str_categories.gsub(/\s+/, "").split(",")
      request = Request.new(status:request_strong_params["status"],user_id:request_strong_params["user_id"],content: request_strong_params["content"],categories: array_categories)
    end 
    
    if request.save
      if request_params[:image]
        request.image.attach(request_params[:image])
      end
    if request_strong_params[:image]
      request.image.attach(request_strong_params[:image])
    end
 
      @requests_approved = Request.most_recently_added_all_approved.paginate(page: params[:page], per_page: 10)
      flash[:notice] = "Your request has been added."
      redirect_back(fallback_location: root_path)
    else
      errors = ""
      if request.errors.any?
        errors = request.errors.full_messages.join(", ")
      end
      flash[:alert] = "There was an error adding your request. #{errors}."
      redirect_back(fallback_location: root_path)
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
  def show
    @request = Request.find(params[:id])
    render :show
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
  def request_strong_params
    params.require(:request).permit(:user_id, :image, :content,:status,:categories)
  end

  def request_params
    params.permit(:user_id, :image, :content,:status,:categories)
  end
  def description_params
    params.permit(:user_id, :request_id, :content,:status)
  end
end