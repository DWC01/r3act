class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
    	t.string :name
    	t.string :mime_type
    	t.string :meta_data
      t.string :ad_tag_code
      t.string :dimensions
      t.string :url
      t.string :etag
      t.string :extension
      t.string :creative_landing_page
      t.string :creative_type
    	t.string :width
    	t.string :height
      t.references :main_creative, index: true
      t.integer :flight_id

      t.timestamps null: false
    end
  end
end
