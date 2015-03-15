class Campaign < ActiveRecord::Base
  has_many :flights
  mount_uploader :ad_tags_file, AdTagsFileUploader

  # def self.save_mp_data(campaign, ad_tags)
  #   ad_tag = ad_tags.first
  #   ad_types = AttsArrayFor.ad_types(ad_tags)
  #   ad_sizes = AttsArrayFor.ad_sizes(ad_tags)
  #   tag_receivers = AttsArrayFor.ad_tag_receivers(ad_tags)


  #   campaign.name = "#{ad_tag.advertiser} - #{ad_tag.primary_target_audience}"
  #   campaign.advertiser       = ad_tag.advertiser 
  #   campaign.ad_tags_count    = ad_tags.length
  #   campaign.start_date       = ad_tag.start_date || ad_tag.date
  #   campaign.end_date         = ad_tag.end_date
  #   campaign.ad_types         = ad_types
  #   campaign.ad_sizes         = ad_sizes
  #   campaign.ad_tag_receivers = tag_receivers
  #   campaign.media_plan_name = ad_tag.version
  #   campaign.save

  #   # campaign.ad_tag_provider = ad_tag.ad_tag_provider
  #   # campaign.ad_tag_sender = ad_tag.ad_tag_sender
  #   # campaign.ad_tag_receivers = sdfasd
  #   # campaign.advertiser = ad_tag.advertiser

  # end
end
