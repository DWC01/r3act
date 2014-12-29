class CampaignsController < ApplicationController
  include CampaignMethods
  
  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      save_file_as_ad_tags(ad_tags_file_path) 
      redirect_to @campaign
    else
      redirect_to :new 
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    @csv      = CaratSchedule.new(ad_tags_file_path)
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

  private

    def ad_tags_file_path
      @campaign.ad_tags_file_url.to_s
    end

    def campaign_params
      params.require(:campaign).permit(:name, 
      :ad_tags_file, :ad_tags_count, :start_date,
      :end_date, :placement_sizes, :display_types, 
      :ad_tag_provider, :ad_tag_sender, :ad_tag_receivers,
      :advertiser_name, :media_plan_name)
    end
end
