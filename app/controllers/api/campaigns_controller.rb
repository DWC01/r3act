module Api
  class CampaignsController < Api::BaseController
    before_action :aws_s3, only: [:create]
    before_action :authenticate, only: [:show, :new, :index]

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
      # Taking the media plan key returned from s3, and
      # converting it into a signed file path, @aws_s3 is 
      # an instance of the AWS::S3 SDK
      @campaign.media_plan = @aws_s3.file_path(@campaign.media_plan)

      if @campaign.save
        save_data_from_media_plan(@campaign.media_plan)
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
  
    private

      def save_data_from_media_plan(file_path)
        mp = MediaPlanParser.new(file_path)
        save_media_plan_data(mp.campaign_atts, mp.flight_ad_tags_atts)
      end

      def save_media_plan_data(campaign_atts, flight_ad_tags_atts)
        @campaign.update_attributes(campaign_atts)
        Flight.save_media_plan_data(@campaign, flight_ad_tags_atts)
      end      

      def traffic_ad_tags
        #ad_tags = AdTag.where(campaign_id: params[:campaign_id]) 
        # dfp = Dfp.new( params[:campaign_id], 33988861, params[:advertiser_id], ad_tags )
        # saved_creatives = dfp.traffic_ad_tags
        
        saved_creatives = dfp.mock_saved_creatives
        sleep 3

        render :json => saved_creatives.to_json
      end

      def destroy
        campaign = Campaign.find(params[:id])
        campaign.destroy
        head :no_content
      end

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