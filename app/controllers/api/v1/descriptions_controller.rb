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

  #     def create
  #     end

  #     def update
  #     end

  #     def destroy
  #     end private def description_params params.permit
    end
  end
end