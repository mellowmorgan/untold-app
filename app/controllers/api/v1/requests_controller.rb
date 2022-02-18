module Api
  module V1
    class RequestsController < ApplicationController
      def index
        @requests = Request.all
        json_response(@requests)
      end

      def show
        @request = Request.find(params[:id])
      end

      def create
        if @request.create!(request_params)
          render status: 200, json: {
          message: "Request added successfully."
          }
        end
      end

      def update
        @request = Request.find(params[:id])
        @request.update()
        if @request.save
          render status: 200, json: {
            message: "Request updated successfully."
            }
        end
      end

      def destroy
        @request = Request.find(params[:id])
        if @request.destroy
          render status: 200, json: {
          message: "Request has been deleted successfully."
          }
        end
      end
      private
      def request_params
        params.require(:request).permit(:user_id,:content,:status)
      end
    end
  end
end