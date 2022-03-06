module Api
  module V1
    class DescriptionsController < ApplicationController
      
      def index
        if params[:request_id]
          descriptions = Description.find_by_request(params[:request_id])
          json_response(descriptions)
        else 
          descriptions = Description.all
          json_response(descriptions)
        end
      end

      def show
        description = Description.find(params[:id])
        json_response(description)
      end

      def create
        if Description.create!(description_params)
          render status: 200, json: {message: "Description added successfully."}
        else
          render json: {error: "There was an error creating the description."}
        end
      end

      def update
        description = Description.find(params[:id])
        if description.update(description_params)
          render status: 200, json: {message: "Description updated successfully."}
        else
          render json:{error:"There was an error updating the description."}
        end
      end

      def destroy
        description = Description.find(params[:id])
        if description.destroy
          render status: 200, json: {
          message: "Description has been deleted successfully."
          }
        else
          { error: "There was an error deleting the description." }
        end
      end
    private 
      def description_params 
        params.permit(:content, :status, :user_id,:rating, :request_id)
      end
    end
  end
end