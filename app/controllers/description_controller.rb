# require('pry')
# class RequestsController < ApplicationController
#   include Devise::Controllers
#   def add_description
   
#       desc = Description.new(status:request_strong_params["status"],user_id:request_strong_params["user_id"],content: request_strong_params["content"],categories: array_categories)
#     end 
  
#     if desc.save
#       @requests_approved = Request.most_recently_added_all_approved.paginate(page: params[:page], per_page: 10)
#       flash[:notice] = "Your request has been added."
#       redirect_back(fallback_location: root_path)
#     else
#       errors = ""
#       if request.errors.any?
#         errors = request.errors.full_messages.join(", ")
#       end
#       flash[:alert] = "There was an error adding your request. #{errors}."
#       redirect_back(fallback_location: root_path)
#     end
#   end
  
#   private

#   def description_params
#     params.permit(:user_id, :request_id, :content,:status)
#   end
# end