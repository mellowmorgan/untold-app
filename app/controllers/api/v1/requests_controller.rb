require('pry')
module Api
  module V1
    class RequestsController < ApplicationController
      def index
        requests = Request.all
        json_response(requests)
      end

      def show
        request = Request.find(params[:id])
        json_response(request)
      end
      
      def published
        requests_published = Request.most_recently_added_published
        if requests_published
          json_response(requests_published)
        else
          render json: { error: "error getting published requests." }
        end
      end
      

      def create
        
        if request_params[:categories]
          str_categories = request_params["categories"]
          array_categories = str_categories.gsub(/\s+/, "").split(",")
        end 
        if !request_params[:categories]
          array_categories = []
        end
        request = Request.new(status:request_params["status"],user_id:request_params["user_id"],content: request_params["content"],categories: array_categories, image_url: request_params["image_url"])
   
        if request.save
          if request.image_url
            request.grab_image
          end
          render status: 200, json: {
          message: "Request added successfully."
          }
        else
          render json: { error: "Unable to create new request." }
        end
      end

      def update
        request = Request.find(params[:id])
        request.update(request_params)
        if request.save
          render status: 200, json: {
            message: "Request updated successfully."
            }
        else
          render json: { error: "There was an error updating the request." }
        end
      end

      def destroy
        request = Request.find(params[:id])
        if request.destroy
          render status: 200, json: {
          message: "Request has been deleted successfully."
          }
        else
          { error: "There was an error deleting the request." }
        end
      end
      private
      
      def request_params
        params.permit(:user_id, :image_url,:content,:status,:categories)
      end
    end
  end
end
