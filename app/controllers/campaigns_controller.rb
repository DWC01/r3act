class CampaignsController < ApplicationController
  
  def index
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to @campaign
    else
      redirect_to :new 
    end
  end

  def show
    @campaigns = Campaign.find(params[:id])
  end

  def destroy
    Campaign.find(params[:id]).destroy
    flash[:success] = "Campaign Successfully Deleted!"
    redirect_to campaigns_path
  end

  private
    def campaign_params
      params.require(:campaign).permit(:name, 
      :ad_tags_file, :ad_tags_count, :start_date,
      :end_date, :placement_sizes, :display_types, 
      :ad_tag_provider, :ad_tag_sender, :ad_tag_receivers,
      :advertiser_name, :media_plan_name)
    end
end
