class AdTagsController < ApplicationController
  def index
  end

  def new
    @ad_tag = AdTag.new
  end

  def create
    @ad_tag = AdTag.new(campaign_params)
    if @ad_tag.save
      redirect_to @ad_tag
    else
      render :new
    end
  end

  def show
    @ad_tags = AdTag.find(params[:id])
  end

  def destroy
    AdTag.find(params[:id]).destroy
    flash[:success] = "Ad Tag Successfully Deleted!"
    redirect_to ad_tags_path
  end

  private
    def ad_tag_params
      params.require(:ad_tag).permit(:target, 
      :media_partner, :placement_name, :ad_type,
      :ad_type_details, :product, :size, :width,
      :height, :device, :unit_cost, :impressions,
      :total_cost, :start_date, :end_date,
      :flight_dates, :campaign_id)
    end
end
