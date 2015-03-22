FactoryGirl.define do
  factory :campaign do
    ad_sizes                    "300x250, 728x90, 160x600"
    ad_tag_provider             "Carat"
    ad_tag_receivers            "[Amnet, TradeDesk, Media Math]"
    ad_tag_sender               "Carat"
    ad_tags_count               "12"
    ad_tags_file                ""
    ad_devices                  "Desktop, Mobile"
    ad_formats                  "HTML5"
    advertiser                  "My Magazine"
    end_date                    "1/1/2016"
    media_plan_name             "Best Campaign Ever (CTR through the roof)"
    name                        "Best Campaign Ever (CTR through the roof)"
    primary_target_audience     "Males 20-30"
    start_date                  "1/1/2015"
    company_id                  1
  end
end