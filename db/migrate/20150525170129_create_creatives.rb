class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
    	t.string :name
    	t.string :mime_type
    	t.string :s3_data
    	t.string :width
    	t.string :height
    	t.string :dimensions
    	t.string :flight_id

      t.timestamps null: false
    end
  end
end
