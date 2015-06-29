class CreativeSerializer < ActiveModel::Serializer
  attributes :id, :name, :meta_data, :extension, 
	  :resource_url, :landing_page_url, :width, :height,
	  :dimensions, :size, :mime_type, :creative_type,
	  :compressed, :version, :bit_count, :swf_xmax,
	  :swf_ymax, :frame_rate, :frame_count, :duration,
	  :avm_version, :signature, :etag, :flight_id, :campaign_id,
	  :created_at, :updated_at

  has_one :backup_creative
end