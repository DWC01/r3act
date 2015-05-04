class Flight < ActiveRecord::Base
  belongs_to :campaign
  has_many :ad_tags

  def self.save_media_plan_data(campaign, flight_ad_tags_atts)
    flight_ad_tags_atts.each do |flight_ad_tag_atts|
      flight_atts  = flight_ad_tag_atts[0]
      ad_tags_atts = flight_ad_tag_atts[1]
      flight       = Flight.new(flight_atts)

      if flight.save
        campaign.flights << flight
        AdTag.save_media_plan_data(flight, ad_tags_atts)
      end
    end
  end

end
