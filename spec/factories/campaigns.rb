FactoryGirl.define do
  factory :campaign do
  name              "Christmas Campaign"
  ad_tags_file      ""
  ad_tags_count     "12"
  start_date        "12/1/2014"
  end_date          "12/31/2014"
  placement_sizes   "300x250, 728x90, 160x600"
  display_types     "Desktop"
  ad_tag_provider   "Carat"
  ad_tag_sender     "Carat"
  ad_tag_receivers  "[Amnet, TradeDesk, Media Math]"
  advertiser_name   "Coca Cola"
  media_plan_name   "Christmas Schedule"
  end
end
