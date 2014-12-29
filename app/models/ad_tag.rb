class AdTag < ActiveRecord::Base

  def self.save_tags(placements)
    placements.each do |ad_tag_atts|
      AdTag.new(ad_tag_atts).save!
    end
  end

end
