class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string    :ad_sizes, array: true, default: []
      t.string    :ad_tag_provider
      t.string    :ad_tag_receivers, array: true, default: []
      t.string    :ad_tag_sender
      t.string    :ad_tags_count
      t.string    :ad_tags_file
      t.string    :ad_devices, array: true, default: []
      t.string    :ad_formats, array: true, default: []
      t.string    :advertiser
      t.string    :end_date
      t.string    :media_plan_name
      t.string    :name
      t.string    :primary_target_audience
      t.string    :start_date
      t.integer   :company_id
      
      t.timestamps
    end
  end
end
