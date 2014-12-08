module Api
  module V1
    class DashboardsController < ApplicationController
    respond_to :json
      def index
        respond_with("Heyo!")
      end
    end
  end
end