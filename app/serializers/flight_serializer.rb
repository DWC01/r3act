class FlightSerializer < ActiveModel::Serializer
  attributes :id, :name, :adserver_cost, :start_date, :end_date,
          :ad_tag_count, :campaign_id
end