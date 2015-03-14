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
        params.require(:ad_tag).permit(
        :ad_type, :adserver_cost, :advertiser, :audience,
        :cost_basis, :cost_method, :days, :details, :device,
        :end_date, :flight, :format, :height, :impressions,
        :javascript_tag, :publisher, :media_plan_name, :placement,
        :primary_target_audience, :product, :properties, :size,
        :site, :start_action, :start_date, :unit_cost, :width,
        :campaign_id
        )
      end

      def query_params
        params.permit()
      end
  end
end