class Campaign < ActiveRecord::Base
  has_many :ad_tags
  mount_uploader :ad_tags_file, AdTagsFileUploader
end
