class FlightSerializer < ActiveModel::Serializer
  has_many :ad_tags
  attributes :id, :name, :adserver_cost, :start_date, :end_date,
          :ad_tag_count, :campaign_id
end