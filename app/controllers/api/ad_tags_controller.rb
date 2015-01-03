module Api
  class AdTagsController < Api::BaseController

    def index
      if params[:campaign_id]
        campaign = Campaign.find(params[:campaign_id])
        render json: {r3act: campaign.ad_tags}
      else
        render json: {r3act: AdTag.all}
      end        
    end

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