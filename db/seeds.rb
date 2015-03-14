AdTag.delete_all
Campaign.delete_all

(1..3).each do |id|
  20.times do 
    AdTag.create(
    ad_type:                       "Large Skyscraper",
    adserver_cost:                 "3000",
    advertiser:                    "Widget",
    audience:                      "Males who read My Magazine",
    cost_basis:                    "3000",
    cost_method:                   "CPM",
    days:                          "Mon-Fri",
    details:                       "Alway above fold",
    device:                        "Desktop",
    end_date:                      "1/1/2016",
    flight:                        "Retargeting",
    format:                        "HTML5",
    height:                        "600",
    impressions:                   "1000000000",
    javascript_tag:                "<script> console.log('Tag code here!!') </sscript>",
    publisher:                     "Google",
    media_plan_name:               "Best Campaign Ever (CTR through the roof!!)",
    placement:                     "Google_My Magazine_Males 20-30_300x600",
    primary_target_audience:       "Males 20-30",
    product:                       "Magazine",
    properties:                    "North America",
    size:                          "300x600",
    site:                          "mymagazine.com",
    start_action:                  "auto",
    start_date:                    "1/1/2015",
    unit_cost:                     "1.50",
    width:                         "300",
    campaign_id:                   id
    )
  end
end 

3.times do
  Campaign.create(  
    ad_sizes:                    "300x250, 728x90, 160x600",
    ad_tag_provider:             "Carat",
    ad_tag_receivers:            "[Amnet, TradeDesk, Media Math]",
    ad_tag_sender:               "Carat",
    ad_tags_count:               "12",
    ad_tags_file:                "",
    ad_devices:                  "Desktop, Mobile",
    ad_formats:                  "HTML5",
    advertiser:                  "My Magazine",
    end_date:                    "1/1/2016",
    media_plan_name:             "Best Campaign Ever (CTR through the roof)",
    name:                        "Best Campaign Ever (CTR through the roof)",
    primary_target_audience:     "Males 20-30",
    start_date:                  "1/1/2015"
  )
end