FactoryGirl.define do
  factory :flight do
    name            "Retargeting"
    start_date      "1/1/2015"
    end_date        "1/1/2016"
    adserver_cost   "3000"
    ad_tag_count    "15"
    campaign_id     1
  end
end