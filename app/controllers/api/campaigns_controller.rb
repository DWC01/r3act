module Api
  class CampaignsController < Api::BaseController
    before_action :authenticate, only: [:show, :new, :index]
    
    def new
      campaign = Campaign.new
      render json: {campaign: campaign}, status: 200
    end

    def index
      campaigns = Campaign.where(query_params)
      if campaigns
        render json: {campaign: campaigns}, status: 200
      else
        render json: {message: 'No campaigns found'}, status: 422
      end
    end

    def show
      campaign = Campaign.find(params[:id])
      if campaign
        render json: {campaign: campaign}, status: 200
      else
        render json: {message: 'Campaign not found'}, status: 422
      end
    end

    def create
      @campaign = Campaign.new(campaign_params)
      if @campaign.save
        Campaign.save_data_from_media_plan(@campaign)
        render json: {campaign: @campaign}, status:200
      else
        render json: {errors: @campaign.errors.to_h}, status:422
      end
    end

    def update
      campaign = Campaign.find(params[:id])
      if campaign.update_attributes(campaign_params)
        render json: {campaign: campaign}, status: 200
      else
        render json: {errors: campaign.errors.to_h}, status: 422
      end
    end  

    def destroy
      campaign = Campaign.find(params[:id])
      campaign.destroy
      head :no_content
    end

    def traffic_campaign
      campaign = Campaign.find(params[:campaign][:id])
      # response = campaign.traffic_dfp_ad_tags(params)
      response = campaign.mock_dfp_response; sleep 5;
      render json: response
    end

    private

      def campaign_params
        params.require(:campaign).permit(
          :ad_sizes, :ad_tag_provider, :ad_tag_receivers,
          :ad_tag_sender, :ad_tags_count, :media_plan,
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