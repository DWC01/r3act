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
      save_file_as_ad_tags(@campaign, ad_tags_file_path) 
      redirect_to @campaign
    else
      redirect_to :new 
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
    flash[:success] = "Campaign Successfully Deleted!"
    redirect_to campaigns_path
  end

  def traffic_ad_tags
    ad_tags = AdTag.where(campaign_id: params[:campaign_id]) 
    dfp = Dfp.new( params[:campaign_id], 33988861, params[:advertiser_id], ad_tags )
    
    # saved_creatives = dfp.mock_saved_creatives
    # sleep 3

    saved_creatives = dfp.traffic_ad_tags

    render :json => saved_creatives.to_json
  end

  private

    def save_file_as_ad_tags(campaign, file_path)
      csv = MediaPlan.new(file_path)
      # ad_tags = AdTag.save_tags(campaign, csv.placements)
      # Campaign.save_mp_data(campaign, ad_tags)
    end

    def ad_tags_file_path
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
