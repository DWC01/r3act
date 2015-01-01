class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string    :name
      t.string    :ad_tags_file
      t.string    :ad_tags_count
      t.string    :start_date
      t.string    :end_date
      t.string    :placement_sizes
      t.string    :display_types
      t.string    :ad_tag_provider
      t.string    :ad_tag_sender
      t.string    :ad_tag_receivers, array: true, default: []
      t.string    :advertiser
      t.string    :media_plan_name
      
      t.timestamps
    end
  end
end
