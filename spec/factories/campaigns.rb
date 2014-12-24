FactoryGirl.define do
  factory :campaign do
  name              "Christmas"
  ad_tags_file      "ad_tags_file"
  ad_tags_count     "ad_tags_count"
  start_date        "start_date"
  end_date          "end_date"
  placement_sizes   "placement_sizes"
  display_types     "display_types"
  ad_tag_provider   "ad_tag_provider"
  ad_tag_sender     "ad_tag_sender"
  ad_tag_receivers  "ad_tag_receivers"
  advertiser_name   "advertiser_name"
  media_plan_name   "media_plan_name"
  
  end
end
