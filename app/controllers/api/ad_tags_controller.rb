module Api
  class AdTagsController < Api::BaseController
    
    private
      def ad_tag_params
        params.require(:ad_tag).permit(:target, 
        :media_partner, :placement_name, :ad_type,
        :ad_type_details, :product, :size, :width,
        :height, :device, :unit_cost, :impressions,
        :total_cost, :start_date, :end_date,
        :flight_dates)
      end

      def query_params
        params.permit()
      end
  end
end