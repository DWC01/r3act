class Campaign < ActiveRecord::Base
  has_many :campaigns
  mount_uploader :ad_tags_file, AdTagsFileUploader
end
