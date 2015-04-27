class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :ad_sizes, :ad_tag_provider, :ad_tag_receivers,
            :ad_tag_sender, :ad_tags_count, :media_plan_key,
            :ad_devices, :ad_formats, :advertiser, :end_date,
            :media_plan_name, :name, :primary_target_audience,
            :start_date, :created_at, :updated_at, :company_id
end