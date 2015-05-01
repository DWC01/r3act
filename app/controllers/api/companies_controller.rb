module Api
  class CompaniesController < Api::BaseController
    
    private
      def company_params
        params.require(:company).permit(
          :name, :logo_original, :placements_trafficked,
          :placement_rate
        )
      end

      def query_params
        params.permit()
      end
  end
end