class CampaignsController < ApplicationController
  
  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
       save_data_from_media_plan(media_plan_file_path)
      redirect_to "/campaigns/#{@campaign.id}"
    else
      redirect_to "/campaigns/new"
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      redirect_to @campaign
    else
      render("edit")
    end
  end

  def destroy
    Campaign.find(params[:id]).destroy
    redirect_to campaigns_path
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

    def media_plan_file_path
      @campaign.ad_tags_file_url.to_s
    end

    def campaign_params
      params.require(:campaign).permit(
        :ad_sizes, :ad_tag_provider, :ad_tag_receivers,
        :ad_tag_sender, :ad_tags_count, :ad_tags_file,
        :ad_devices, :ad_formats, :advertiser, :end_date,
        :media_plan_name, :name, :primary_target_audience,
        :start_date
      )
    end
end
