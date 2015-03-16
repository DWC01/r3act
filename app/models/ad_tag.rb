class AdTag < ActiveRecord::Base
  belongs_to :flight

  def self.save_media_plan_data(flight, ad_tags_atts)
    ad_tags_atts.each do |ad_tag_atts|
      ad_tag = AdTag.new(ad_tag_atts)
      if ad_tag.save
        flight.ad_tags << ad_tag
      end
    end
  end

end
