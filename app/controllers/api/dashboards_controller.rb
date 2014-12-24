module Api
  class DashboardsController < Api::BaseController
    
    private
      def dashboard_params
        params.require(:dashboard).permit(:title, :category, :size)
      end

      def query_params
        params.permit()
      end
  end
end