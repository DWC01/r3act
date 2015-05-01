class Avatar
  attr_reader :original_url, :profile_url, :nav_url

  def initialize(user_id, img_url)
    @user_id = user_id
    @img_url = img_url
    set_aws_variables
  end

  def proccess_img
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

  private

  def set_aws_variables
    @aws_s3 = AWS::S3.new
    @uuid = SecureRandom.uuid
    @bucket = set_bucket
    @acl = set_acl
  end

  def resize_to_fill(width, height)
    @original_img.clone.resize_to_fill(width, height)
  end

  def write_to_bucket(file_name, img, acl)
    s3_buckets_objects(file_name).write(img.to_blob, acl)
  end

  def s3_buckets_objects(file_name)
    @aws_s3.buckets[@bucket].objects["#{file_name}-#{@uuid}.jpg"]
  end

  def set_bucket
   "r3act/uploads/#{Rails.env}/user/avatar/#{@user_id}"
  end

  def set_acl
    {:acl=>:public_read}
  end

end