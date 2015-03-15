class AdTag < ActiveRecord::Base
  belongs_to :flight

  def self.save_tags(flight, placements)
    ad_tags=[]
    placements.each do |ad_tag_atts|
      ad_tag = AdTag.new(ad_tag_atts)
      if ad_tag.save
        flight.ad_tags << ad_tag
        ad_tags << ad_tag
      end
    end
    ad_tags
  end

end
