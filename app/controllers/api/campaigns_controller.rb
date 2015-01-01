module Api
  class CampaignsController < Api::BaseController

    def ad_tags
      campaign = Campaign.find(params[:id])
      render json: campaign.ad_tags
    end
    
    private
      def campaign_params
        params.require(:campaign).permit(:name, 
        :ad_tags_file, :ad_tags_count, :start_date,
        :end_date, :placement_sizes, :display_types, 
        :ad_tag_provider, :ad_tag_sender, :ad_tag_receivers,
        :advertiser_name, :media_plan_name)
      end

      def query_params
        params.permit()
      end
  end
end