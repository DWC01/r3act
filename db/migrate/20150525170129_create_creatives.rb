class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
      t.string    :name
      t.string    :meta_data
      t.string    :extension
      t.string    :resource_url
      t.string    :backup_img_url
      t.string    :creative_landing_page
      t.string    :width
      t.string    :height
      t.string    :dimensions
      t.string    :size 
      t.string    :mime_type
      t.string    :creative_type
      t.string    :compressed
      t.string    :version
      t.string    :bit_count
      t.string    :swf_xmax
      t.string    :swf_ymax
      t.string    :frame_rate
      t.string    :frame_count
      t.string    :duration
      t.string    :avm_version
      t.string    :signature
      t.string    :etag
      t.integer   :flight_id

      t.timestamps null: false
    end
  end
end
