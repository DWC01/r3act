class AvatarProcessor
  attr_reader :original_url, :profile_url, :nav_url, :mime_type, 
              :etag, :name, :values_hash

  def initialize(id, s3_data)
    @id = id
    set_s3_data_variables(s3_data)
    set_aws_variables
  end

  def proccess_imgs_save_to_s3
    generate_original_img(@img_url)
    generate_additional_sizes
    save_to_s3
    set_public_urls
  end

  def generate_original_img(url)
    @original_img = Magick::Image::read(url).first
  end

  def generate_additional_sizes
    @profile_img = resize_to_fill(75,75)
    @nav_img = resize_to_fill(30,30)
  end
  
  def save_to_s3 
    @original_img = write_to_bucket('avatar_original', @original_img, @acl)
    @profile_img = write_to_bucket('avatar_profile', @profile_img, @acl)
    @nav_img = write_to_bucket('avatar_nav', @nav_img, @acl)
  end

  def set_public_urls
    @original_url = @original_img.public_url.to_s
    @profile_url  = @profile_img.public_url.to_s
    @nav_url      = @nav_img.public_url.to_s
  end

  def values_hash
    {name: @name,
     mime_type: @mime_type,
     nav_url: @nav_url,
     profile_url: @profile_url,
     original_url: @original_url}
  end

  private

  def set_aws_variables
    @aws_s3 = AWS::S3.new
    @bucket = set_bucket
    @acl = set_acl
  end

  def set_s3_data_variables(s3_data)
    if s3_data.blank?
      @name = default_name,
      @etag = default_etag,
      @img_url = default_img_url
    else
      @name = s3_data['name']
      @etag = s3_data['etag']
      @mime_type = s3_data['mime_type']
      @img_url = s3_data['tmp_img_path']
      @extension = set_extension(s3_data)
    end
  end

  def set_extension(s3_data)
    s3_data['tmp_img_path'].split('.').pop
  end

  def resize_to_fill(width, height)
    @original_img.clone.resize_to_fill(width, height)
  end

  def write_to_bucket(file_name, img, acl)
    s3_buckets_objects(file_name).write(img.to_blob, acl)
  end

  def s3_buckets_objects(file_name)
    @aws_s3.buckets[@bucket].objects["#{file_name}-#{@etag}.#{@extension}"]
  end

  def set_bucket
   "r3act/uploads/#{Rails.env}/user/avatar/#{@id}"
  end

  def set_acl
    {:acl=>:public_read}
  end

  def default_name
    'abe-lincoln'
  end

  def default_etag
    'f3e57cd4805076f73ec92c6ddef08447'
  end

  def default_img_url
    'https://s3-us-west-1.amazonaws.com/displayadtech/fallbacks/abe.jpg'
  end

end