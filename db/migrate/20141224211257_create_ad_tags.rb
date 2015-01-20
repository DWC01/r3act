class CreateAdTags < ActiveRecord::Migration
  def change
    create_table :ad_tags do |t|
      t.string    :target
      t.string    :audience
      t.string    :media_partner
      t.string    :placement_name
      t.string    :ad_type
      t.string    :ad_type_details
      t.string    :product
      t.string    :size
      t.string    :width
      t.string    :height
      t.string    :device
      t.string    :unit_cost
      t.string    :impressions
      t.string    :total_cost
      t.string    :start_date
      t.string    :end_date
      t.string    :flight
      t.string    :flight_dates
      t.string    :total_digital_cost
      t.string    :advertiser
      t.string    :period
      t.string    :primary_target_audience
      t.string    :date
      t.string    :version
      t.text      :javascript_tag
      t.integer   :campaign_id

      t.timestamps
    end
  end
end
