class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
    	t.string :name
    	t.string :mime_type
    	t.string :meta_data
    	t.string :width
    	t.string :height
    	t.string :dimensions
      t.string :url
      t.string :extension
    	t.integer :flight_id

      t.timestamps null: false
    end
  end
end
