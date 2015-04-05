class AdTagSerializer < ActiveModel::Serializer
  attributes :id, :ad_type, :advertiser, :audience,
        :cost_basis, :cost_method, :days, :details, :device,
        :end_date, :flight, :format, :height, :impressions,
        :javascript_tag, :publisher, :media_plan_name, :placement,
        :primary_target_audience, :product, :properties, :size,
        :site, :start_action, :start_date, :unit_cost, :width,
        :created_at, :updated_at, :total_cost, :client_cost, :flight_id
end