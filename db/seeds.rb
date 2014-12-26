AdTag.delete_all
Campaign.delete_all

20.times do 
  AdTag.create(
  target:            "All Markets",
  media_partner:     "Amnet",
  placement_name:    "Amnet_Desktop_Targeting Males18-36_112-2912_300x250",
  ad_type:           "MREC OTP + Skins",
  ad_type_details:   "Thursday to Sunday",
  product:           "Retail",
  size:              "300x250",
  width:             "300",
  height:            "250",
  device:            "Desktop",
  unit_cost:         "17.07",
  impressions:       "223250",
  total_cost:        "3810.88",
  start_date:        "01/12/2014",
  end_date:          "31/12/2014",
  flight_dates:      "112-3112"
  )
end

20.times do
  Campaign.create(  
  name:              "Christmas Campaign",
  ad_tags_file:      "",
  ad_tags_count:     "12",
  start_date:        "12/1/2014",
  end_date:          "12/31/2014",
  placement_sizes:   "300x250, 728x90, 160x600",
  display_types:     "Desktop",
  ad_tag_provider:   "Carat",
  ad_tag_sender:     "Carat",
  ad_tag_receivers:  "[Amnet, TradeDesk, Media Math]",
  advertiser_name:   "Coca Cola",
  media_plan_name:   "Christmas Schedule"
  )
end