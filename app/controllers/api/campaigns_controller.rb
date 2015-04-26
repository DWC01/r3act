module Api
  class CampaignsController < Api::BaseController
    before_action :aws_s3, only: [:create]
    before_action :authenticate, only: [:show, :new, :index]

    def index
      render json: Campaign.all
    end
  
    def show
      render json: Campaign.find(params[:id])
    end

    def create
      @campaign = Campaign.new(campaign_params)
      if @campaign.save
        save_data_from_media_plan(@campaign)
        render json: {campaign: @campaign}, status:200
      else
        render json: {errors: @campaign.errors.to_h}, status:422
      end
    end
  
    private

      def save_data_from_media_plan(campaign)
        file_path = media_plan_file_path(campaign)
        mp = MediaPlanParser.new(file_path)
        save_media_plan_data(mp.campaign_atts, mp.flight_ad_tags_atts)
      end

      def save_media_plan_data(campaign_atts, flight_ad_tags_atts)
        @campaign.update_attributes(campaign_atts)
        Flight.save_media_plan_data(@campaign, flight_ad_tags_atts)
      end

      def media_plan_file_path(campaign)
        storage = parse_s3_key(campaign.media_plan_key)
        s3_file_path(storage)
      end

      def s3_file_path(storage)
        @s3.buckets[storage[:bucket]+storage[:key]]
           .objects[storage[:file_name]]
           .url_for(:read).to_s
      end

      def traffic_ad_tags
        #ad_tags = AdTag.where(campaign_id: params[:campaign_id]) 
        # dfp = Dfp.new( params[:campaign_id], 33988861, params[:advertiser_id], ad_tags )
        # saved_creatives = dfp.traffic_ad_tags
        
        saved_creatives = dfp.mock_saved_creatives
        sleep 3

        render :json => saved_creatives.to_json
      end

      def campaign_params
        params.require(:campaign).permit(
          :ad_sizes, :ad_tag_provider, :ad_tag_receivers,
          :ad_tag_sender, :ad_tags_count, :media_plan_key,
          :ad_devices, :ad_formats, :advertiser, :end_date,
          :media_plan_name, :name, :primary_target_audience,
          :start_date
        )
      end
  end
end