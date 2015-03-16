class Campaign < ActiveRecord::Base
  has_many :flights
  mount_uploader :ad_tags_file, AdTagsFileUploader
end
