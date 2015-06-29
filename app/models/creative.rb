class Creative < ActiveRecord::Base
  before_validation :set_meta_data, on: [:create, :update]
  validate :validate_creative, on: [:create, :update]
  before_save :process_creative
  belongs_to :flight

  # ---- Before Validate --------
  
	def set_meta_data
    @meta_data = JSON.parse(self.meta_data)
    @meta_data['file_name'] = @meta_data['name'].split('.').shift if @meta_data['name']
    @meta_data['extension'] = @meta_data['name'].split('.').pop if @meta_data['name']
    @meta_data['etag'] = @meta_data['etag'].gsub("\"","") if @meta_data['etag']  
  end

  # ---- Validate --------

  def validate_creative
  	validate_ad_tag if self.creative_type == 'main-ad-tag'
    validate_main_creative if self.creative_type == 'main-creative'
  end

  def validate_ad_tag
    validates_presence_of :width, :height, :name

    if @meta_data['ad_tag_code'].blank?
	    errors.add(:ad_tag_code, 'Ad Tag Code can\'t be blank') 
	  end
    
    unless self.width.blank?
      validates_numericality_of :width
    end

    unless self.height.blank?
      validates_numericality_of :height
    end
  end

	def validate_main_creative
	  unless creative_extensions.include? @meta_data['extension']
	    errors.add(:base, 'Creative must be swf, gif, jpg, or png') 
	  end
	end

  # ---- Process Main Creative --------

	def process_creative
		if @meta_data['extension'] == 'swf'
			process_and_save_swf_creative
		end

		if image_extensions.include? @meta_data['extension']
			process_and_save_img_creative
		end

		if self.creative_type == 'main-ad-tag'
			process_and_save_tag_creative
		end
	end

	# ---- Process and Save --------

	def process_and_save_swf_creative
		file = file_from_tmp_file_path
	  swf = set_swf_file(file)

	  save_file_to_S3(file)
	  set_swf_attributes(swf)
	end

	def process_and_save_img_creative
		file = file_from_tmp_file_path
    image = set_img_file

    save_file_to_S3(file)
    set_img_attributes(image)
	end

	def process_and_save_tag_creative
		file = @meta_data['ad_tag_code']
		save_file_to_S3(file)
	end

	# ---- Set File Types --

	def file_from_tmp_file_path
		open(@meta_data['tmp_file_path'])
	end

	def set_img_file
		Magick::Image::read(@meta_data['tmp_file_path']).first
	end
  
	def set_swf_file(file)
	  SwfFile::FlashFile.header(file)
	end

	# ---- Save to S3 --

	def save_file_to_S3(file)
	  @S3 = AwsS3.new(self, @meta_data, file, 'creative')
	  @S3.save_to_s3
	end
	
	# ---- Set Attributes

	def set_swf_attributes(creative)
	  self.attributes=({
	    name: @meta_data['name'],
	    size: creative.size,
	    etag: @meta_data['etag'],
	    width: creative.width,
	    height: creative.height,
	    version: creative.version,
	    swf_xmax: creative.xmax,
	    swf_ymax: creative.ymax,
	    duration: creative.duration,
	    signature: creative.signature,
	    bit_count: creative.bit_count,
	    extension: @meta_data['extension'],
	    meta_data: @meta_data,
	    mime_type: @meta_data['mime_type'],
	    frame_rate: creative.frame_rate,
	    dimensions: "#{creative.width}x#{creative.height}",
	    compressed: creative.compressed?,
	    frame_count: creative.frame_count,
	    avm_version: creative.avm_version,
	    resource_url: @S3.public_url,
	    creative_type: @meta_data['creative_type'],
	    landing_page_url: @meta_data['landing_page_url'],
	    flight_id: @meta_data['parent_model_id']
	  })
	end

	def set_img_attributes(creative)
	  self.attributes=({
	    name: @meta_data['name'],
	    etag: @meta_data['etag'],
	    width: creative.columns,
	    height: creative.rows,
	    dimensions: "#{creative.columns}x#{creative.rows}",
	    extension: @meta_data['extension'],
	    meta_data: @meta_data,
	    mime_type: @meta_data['mime_type'],
	    resource_url: @S3.public_url,
	    creative_type: @meta_data['creative_type'],
	    landing_page_url: @meta_data['landing_page_url'],
	    flight_id: @meta_data['parent_model_id']
	  })
	end

	private
		def creative_extensions
		  ['swf', 'gif', 'jpg', 'png']
		end

		def image_extensions
		  ['gif', 'jpg', 'png']
		end

end
