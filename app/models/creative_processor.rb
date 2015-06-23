class CreativeProcessor
  attr_reader :values_hash

  def initialize(meta_data, model, extension)
    @model = model
    @meta_data = meta_data
    @extension = extension
    update_meta_data
    process_files
    @s3_creative = AwsS3.new(writeable_file, meta_data, model, 'creatives')
  end

  def process_files
    proccess_swf_file if swf?
    proccess_backup_img if img?
    proccess_ad_tag if ad_tag?
  end

  def proccess_swf_file
    @creative = open(@meta_data['tmp_file_path'])
    @swf = SwfFile::FlashFile.header(@creative)
   
    @size = @swf.size 
    puts @swf.compressed?
    puts @swf.version
    puts @swf.bit_count
    puts @swf.xmax
    puts @swf.ymax
    @width = @swf.width # In pixels
    @height = @swf.height # In pixels
    puts @swf.frame_rate
    puts @swf.frame_count
    puts @swf.duration # In milliseconds
    puts @swf.avm_version
    puts @swf.signature
  end

  def proccess_backup_img
    @img = Magick::Image::read(@meta_data['tmp_file_path']).first
    @width = @img.columns
    @height = @img.rows
    @dimensions = "#{@width}x#{@height}"
    @creative = @img.to_blob
  end

  def proccess_ad_tag
    @creative = @model.ad_tag_code.to_s
    @meta_data['file_name'] = @model.name
    @meta_data['extension'] = 'txt'
  end

  def update_meta_data
    unless ad_tag?
      @meta_data['file_name'] = @meta_data['name'].split('.').shift
      @meta_data['extension'] = @meta_data['name'].split('.').pop
      @meta_data['etag'] = @meta_data['etag'].gsub("\"","")
    end
  end

  def save_to_s3
    @s3_creative.save_to_s3
  end
  
  def values_hash
    {name: @model.name || @meta_data['name'],
     etag: @meta_data['etag'],
     mime_type: @meta_data['mime_type'],
     flight_id: @model.flight_id.to_i,
     extension: @meta_data['extension'],
     url: @s3_creative.public_url,     
     width: @width || @model.width,
     height: @height || @model.height,
     dimensions: @dimensions}
  end

  private
  
    def writeable_file
      @creative
    end

    def swf?
      @model.creative_type == 'main-creative'
    end

    def img?
      @model.creative_type == 'backup-creative'
    end

    def ad_tag?
      @model.creative_type == 'main-ad-tag'
    end

end