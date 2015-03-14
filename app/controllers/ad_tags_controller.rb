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
      params.require(:ad_tag).permit(
        :ad_type, :adserver_cost, :advertiser, :audience,
        :cost_basis, :cost_method, :days, :details, :device,
        :end_date, :flight, :format, :height, :impressions,
        :javascript_tag, :publisher, :media_plan_name, :placement,
        :primary_target_audience, :product, :properties, :size,
        :site, :start_action, :start_date, :unit_cost, :width,
        :campaign_id
      )
    end
end