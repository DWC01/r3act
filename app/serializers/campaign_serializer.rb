class CampaignSerializer < ActiveModel::Serializer
  has_many :flights
  attributes :id, :ad_sizes, :ad_tag_provider, :ad_tag_receivers,
            :ad_tag_sender, :ad_tags_count, :ad_tags_file,
            :ad_devices, :ad_formats, :advertiser, :end_date,
            :media_plan_name, :name, :primary_target_audience,
            :start_date
end