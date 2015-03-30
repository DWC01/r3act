module Api
  class CampaignsController < Api::BaseController
  
    def show
      render json: Campaign.find(params[:id])
    end
  
    private
      def campaign_params
        params.require(:campaign).permit(
          :ad_sizes, :ad_tag_provider, :ad_tag_receivers,
          :ad_tag_sender, :ad_tags_count, :ad_tags_file,
          :ad_devices, :ad_formats, :advertiser, :end_date,
          :media_plan_name, :name, :primary_target_audience,
          :start_date
        )
      end

      def query_params
        params.permit()
      end
  end
end