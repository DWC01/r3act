class CreativeProcessor
  attr_reader :values_hash

  def initialize(meta_data, model)
    @model = model
    @meta_data = meta_data
    update_meta_data
    proccess_backup_img
    @s3_creative = AwsS3.new(writeable_file, meta_data, model, 'creatives')
  end

  def update_meta_data
    @meta_data['file_name'] = @meta_data['name'].split('.').shift
    @meta_data['extension'] = @meta_data['name'].split('.').pop
    @meta_data['etag'] = @meta_data['etag'].gsub("\"","")
  end

  def proccess_backup_img
    if @model.creative_type == 'backup-creative'
      @img = Magick::Image::read(@meta_data['tmp_file_path']).first
      @width = @img.columns
      @height = @img.rows
      @dimensions = "#{@width}x#{@height}"
      @creative = @img.to_blob
    end
  end

  def save_to_s3
    @s3_creative.save_to_s3
  end
  
  def values_hash
    {name: @meta_data['name'],
     etag: @meta_data['etag'],
     mime_type: @meta_data['mime_type'],
     flight_id: @model.flight_id.to_i,
     extension: @meta_data['extension'],
     url: @s3_creative.public_url,     
     width: @width,
     height: @height,
     dimensions: @dimensions}
  end

  private
  
  def writeable_file
    @creative || @meta_data['tmp_file_path']
  end

end