class CreateSwfCreatives < ActiveRecord::Migration
  def change
    create_table :swf_creatives do |t|
      t.string    :name
      t.string    :creative_landing_page
      t.string    :meta_data
      t.string    :extension
      t.string    :width
      t.string    :height
    	t.string    :size 
      t.string    :mime_type
      t.string    :creative_type
      t.string    :compressed
      t.string    :version
      t.string    :bit_count
      t.string    :swf_xmax
      t.string    :swf_ymax
      t.string    :url
      t.string    :frame_rate
      t.string    :frame_count
      t.string    :duration
      t.string    :avm_version
      t.string    :signature
      t.string    :etag
      t.integer   :creative_id

      t.timestamps null: false
    end
  end
end
