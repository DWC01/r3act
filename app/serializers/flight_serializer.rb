class FlightSerializer < ActiveModel::Serializer
  attributes :id, :name, :adserver_cost, :start_date, :end_date,
             :campaign, :ad_tag_count, :campaign_id, :created_at, :updated_at
end