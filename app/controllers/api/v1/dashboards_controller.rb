module Api
  module V1
    class DashboardsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        respond_with(Dashboard.all)
      end

      def show
        respond_with(Dashboard.find(params[:id]))
      end

      def create
        @dashboard = Dashboard.new(dash_params)
        if @dashboard.save
          respond_to do |format|
            format.json { render :json => @dashboard }
          end
        end
      end

      def update
        @dashboard = Dashboard.find(params[:id])
        if @dashboard.update(dash_params)
          respond_to do |format|
            format.json { render :json => @dashboard }
          end
        end
      end

      def destroy
        respond_with Dashboard.destroy(params[:id])
      end

    private
      def dash_params
        params.require(:dashboard).permit(:title, :type, :size)
      end
    end
  end
end
