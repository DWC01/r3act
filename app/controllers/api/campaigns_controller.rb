module Api
  class CampaignsController < Api::BaseController
    
    private
      def campaign_params
        params.require(:campaign).permit(:name, 
        :ad_tags_file, :ad_tags_count, :start_date,
        :end_date, :placement_sizes, :display_types, 
        :ad_tag_provider, :ad_tag_sender, :ad_tag_receivers,
        :advertiser, :audience, :media_plan_name)
      end

      def query_params
        params.permit()
      end
  end
end