module Api:
  module V1:
    class RequestController < ApplicationController
      include Devise::Controllers

      def index
        @requests = Request.all
        render :index
      end

      def show
        @request = Request.find(params[:id])
      end
      def new 
        @request = Request.new
        render :new
      end

      def create
        @request = Request.new({user_id:current_user.id, content: request.params[:content]})
      end

      def update
      end

      def destroy
      end
    end
    private
    def request_params
      params.require(:request).permit(:content)
    end
  end
end