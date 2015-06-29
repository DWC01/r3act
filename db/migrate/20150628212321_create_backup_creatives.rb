class CreateBackupCreatives < ActiveRecord::Migration
  def change
    create_table :backup_creatives do |t|
    	t.string :name
    	t.string :meta_data
    	t.string :extension
    	t.string :resource_url
      t.string :landing_page_url
      t.string :width
      t.string :height
      t.string :dimensions
      t.string :size
      t.string :mime_type
      t.string :etag
      t.integer :campaign_id
      t.integer :flight_id
      t.integer :creative_id
      t.timestamps null: false
    end
  end
end
