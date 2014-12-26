class Campaign < ActiveRecord::Base
  mount_uploader :ad_tags_file, AdTagsFileUploader
end
