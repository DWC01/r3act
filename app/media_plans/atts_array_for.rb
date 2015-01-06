class AttsArrayFor
  attr_reader :ad_type

  def self.ad_types(resources)
    atts_array=[]
    resources.each do |resource|
      atts_array << resource.ad_type
    end
    atts_array.uniq
  end

  def self.ad_sizes(resources)
    atts_array=[]
    resources.each do |resource|
      atts_array << resource.size
    end
    atts_array.uniq
  end

  def self.ad_tag_receivers(resources)
    atts_array=[]
    resources.each do |resource|
      atts_array << resource.media_partner
    end
    atts_array.uniq
  end

end