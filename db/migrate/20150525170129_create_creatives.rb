class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
    	t.string   :name
      t.string   :creative_landing_page
      t.string   :dimensions
    	t.string   :width
    	t.string   :height
      t.integer  :flight_id

      t.timestamps null: false
    end
  end
end
