class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string    :name
      t.string    :adserver_cost
      t.string    :start_date
      t.string    :end_date
      t.string    :ad_tag_count
      t.integer   :campaign_id

      t.timestamps
    end
  end
end
