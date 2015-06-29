class BackupCreative < ActiveRecord::Base
	belongs_to :flight
	belongs_to :campaign
	belongs_to :creative
	before_validation :set_meta_data, on: [:create, :update]
	validate :extension, :creative_size, on: [:create, :update]

	# ---- Before Validate --------
  
	def set_meta_data
    @meta_data = JSON.parse(self.meta_data)
    @meta_data['file_name'] = @meta_data['name'].split('.').shift if @meta_data['name']
    @meta_data['extension'] = @meta_data['name'].split('.').pop if @meta_data['name']
    @meta_data['etag'] = @meta_data['etag'].gsub("\"","") if @meta_data['etag']  
  end

  # ---- Validate --------

	def extension
		unless image_extensions.include? @meta_data['extension']
	    errors.add(:base, 'Backup creative must be gif, jpg, or png') 
	  end
	end
	
	def creative_size
		if image_extensions.include? @meta_data['extension']

			creative = Creative.find(self.creative_id)
			img = set_img_file
			
			unless "#{img.columns}x#{img.rows}" == creative.dimensions
	    	errors.add(:base, 'Backup creative must be same size as parent (' + creative.dimensions + ')') 
	  	end

	  end
	end

	def set_img_file
		Magick::Image::read(@meta_data['tmp_file_path']).first
	end


	private
		def image_extensions
		  ['gif', 'jpg', 'png']
		end
end
		# puts ''
		# puts ''
		# puts ''
		# puts ''
		# puts ''
		# puts 'Backup Dimensions'
		# puts "#{img.columns}x#{img.rows}"
		# puts ''
		# puts 'Creative Dimensions'
		# puts creative.dimensions
		# puts ''
		# puts ''
		# puts ''
		# puts ''
		# puts ''
		# puts ''
