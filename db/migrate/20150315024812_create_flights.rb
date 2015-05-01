class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string    :name
      t.string    :adserver_cost
      t.string    :start_date
      t.string    :end_date
      t.string    :ad_tag_count
      t.string    :creative_728_x_90
      t.string    :creative_160_x_600
      t.string    :creative_300_x_250
      t.string    :creative_300_x_600

      t.integer   :campaign_id

      t.timestamps
    end
  end
end
