class Campaign < ActiveRecord::Base
  belongs_to :company
  has_many :flights


  # -- Save Media Plan ----------------

  def self.save_data_from_media_plan(campaign)
    media_plan_url = media_plan_url(campaign)
    mp = MediaPlanParser.new(media_plan_url)
    save_media_plan_data(campaign, mp.campaign_atts, mp.flight_ad_tags_atts)
  end

  def self.save_media_plan_data(campaign, campaign_atts, flight_ad_tags_atts)
    campaign.update_attributes(campaign_atts)
    Flight.save_media_plan_data(campaign, flight_ad_tags_atts)
  end

  def self.media_plan_url(campaign)
    media_plan = JSON.parse(campaign.media_plan)
    media_plan['tmp_file_path']
  end

  # -- Traffic Ad Tags ----------------

  def self.traffic_ad_tags
    #ad_tags = AdTag.where(campaign_id: params[:campaign_id]) 
    # dfp = Dfp.new( params[:campaign_id], 33988861, params[:advertiser_id], ad_tags )
    # saved_creatives = dfp.traffic_ad_tags
    
    saved_creatives = dfp.mock_saved_creatives
    sleep 3

    render :json => saved_creatives.to_json
  end


end
