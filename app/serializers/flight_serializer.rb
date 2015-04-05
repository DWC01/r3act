class FlightSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :adserver_cost, :start_date, :end_date,
             :ad_tag_count, :campaign_id, :created_at, :updated_at

  has_many :ad_tags
end