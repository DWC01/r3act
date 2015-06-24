class Creative < ActiveRecord::Base
  has_one :swf_creative
  has_one :ad_tag_creative
  has_one :img_creative
  belongs_to :flight
end
