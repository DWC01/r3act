class BackupCreative < ActiveRecord::Base
	belongs_to :flight
	belongs_to :campaign
	belongs_to :creative
	before_save :process_creative
	before_validation :set_meta_data, on: [:create, :update]
	validate :validat_extension, :creative_size, on: [:create, :update]

	# ---- Before Validate --------
  
	def set_meta_data
    @meta_data = JSON.parse(self.meta_data)
    @meta_data['file_name'] = @meta_data['name'].split('.').shift if @meta_data['name']
    @meta_data['extension'] = @meta_data['name'].split('.').pop if @meta_data['name']
    @meta_data['etag'] = @meta_data['etag'].gsub("\"","") if @meta_data['etag']
  end

  # ---- Validate --------

	def validat_extension
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

	def process_creative
		file = file_from_tmp_file_path
    image = set_img_file

    save_file_to_S3(file)
    set_img_attributes(image)
	end

	# ---- Set File Types --

	def file_from_tmp_file_path
		open(@meta_data['tmp_file_path'])
	end

	def set_img_file
		Magick::Image::read(@meta_data['tmp_file_path']).first
	end

	# ---- Save to S3 --

	def save_file_to_S3(file)
	  @S3 = AwsS3.new(self, @meta_data, file, 'creative')
	  @S3.save_to_s3
	end
	
	# ---- Set Attributes

	def set_img_attributes(creative)
	  self.attributes=({
	    meta_data: @meta_data,
	    height: creative.rows,
	    width: creative.columns,
	    size: creative.filesize,
	    name: @meta_data['name'],
	    etag: @meta_data['etag'],
	    resource_url: @S3.public_url,
	    extension: @meta_data['extension'],
	    mime_type: @meta_data['mime_type'],
	    flight_id: @meta_data['parent_model_id']
	    landing_page_url: @meta_data['landing_page_url'],
	    dimensions: "#{creative.columns}x#{creative.rows}",
	  })
	end


	private
		def image_extensions
		  ['gif', 'jpg', 'png']
		end
end