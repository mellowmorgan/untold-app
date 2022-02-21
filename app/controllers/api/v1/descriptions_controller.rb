module Api
  module V1
    class DescriptionsController < ApplicationController
      def index
        @descriptions = Description.find_by_request(params[:request_id])
        json_response(@descriptions)
      end

      def show
        @description = Description.find(params[:id])
        json_response(@description)
      end

      def create
        if Description.create!(description_params)
          render status: 200, json: {message: "Description added successfully."}
        else
          render json: {error: "There was an error creating the description."}
        end
      end

  #     def update
  #     end

  #     def destroy
  #     end 
    private 
      def description_params 
        params.permit(:content, :status, :user_id,:rating, :request_id)
      end
    end
  end
end
