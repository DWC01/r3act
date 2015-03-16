class Campaign < ActiveRecord::Base
  belongs_to :company
  has_many :flights
  mount_uploader :ad_tags_file, AdTagsFileUploader
end
