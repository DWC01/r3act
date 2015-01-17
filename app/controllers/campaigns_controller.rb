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

  def media_plan
  end

  def trafficking
  end

  def wrap_up
  end

  def traffic_ad_tags
    network_id    = params[:network_id]
    advertiser_id = params[:advertiser_id]
    campaign_id   = params[:campaign_id]

    dfp = Dfp.new( campaign_id, network_id, advertiser_id )
    saved_creatives = dfp.traffic_ad_tags

    render :json => saved_creatives.to_json
  end

  private

    def save_file_as_ad_tags(campaign, file_path)
      csv = CaratSchedule.new(file_path)
      ad_tags = AdTag.save_tags(campaign, csv.placements)
      Campaign.save_mp_data(campaign, ad_tags)
    end

    def ad_tags_file_path
      @campaign.ad_tags_file_url.to_s
    end

    def campaign_params
      params.require(:campaign).permit(:name, 
      :ad_tags_file, :ad_tags_count, :start_date,
      :end_date, :ad_sizes, :ad_types, 
      :ad_tag_provider, :ad_tag_sender, :ad_tag_receivers,
      :advertiser, :media_plan_name)
    end
end
