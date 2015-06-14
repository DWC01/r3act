class CreativeProcessor
  attr_reader :url, :mime_type, :etag, :name, :values_hash

  def initialize(meta_data)
    @flight_id = meta_data['flight_id']
    set_s3_data_variables(meta_data)
    set_aws_variables
    generate_img(@tmp_img_url)
    set_dimensions
  end

  def proccess_imgs_save_to_s3
    save_to_s3
    set_public_urls
  end

  def generate_img(url)
    @img = Magick::Image::read(url).first
  end
  
  def save_to_s3 
    @img = write_to_bucket('creative', @img, @acl)
  end

  def set_public_urls
    @url = @img.public_url.to_s
  end

  def values_hash
    {name: @name,
     mime_type: @mime_type,
     url: @url,
     extension: @extension,
     width: @width,
     height: @height,
     dimensions: @dimensions,
     flight_id: @flight_id.to_i}
  end

  private

  def set_aws_variables
    @aws_s3 = AWS::S3.new
    @bucket = set_bucket
    @acl = set_acl
  end

  def set_s3_data_variables(meta_data)
    @name = meta_data['name']
    @etag = meta_data['etag']
    @mime_type = meta_data['mime_type']
    @tmp_img_url = meta_data['tmp_file_path']
    @extension = set_extension(meta_data)
  end

  def set_dimensions
    @width = @img.columns
    @height = @img.rows
    @dimensions = "#{@width}x#{@height}"
  end

  def set_extension(meta_data)
    meta_data['tmp_file_path'].split('.').pop
  end

  def write_to_bucket(file_name, img, acl)
    s3_buckets_objects(file_name).write(img.to_blob, acl)
  end

  def s3_buckets_objects(file_name)
    @aws_s3.buckets[@bucket].objects["#{file_name}-#{@etag}.#{@extension}"]
  end

  def set_bucket
   "r3act/uploads/#{Rails.env}/flight/#{@flight_id}/creatives/"
  end

  def set_acl
    {:acl=>:public_read}
  end

end