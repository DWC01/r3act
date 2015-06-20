class AwsS3

  def initialize(file, meta_data, model, bucket_name)
    @file = file
    @model = model
    @meta_data = meta_data
    @bucket_name = bucket_name

    @s3 = AWS::S3.new
    @bucket = set_bucket
    @acl = set_acl
  end

  def save_to_s3
    @s3_file = write_to_bucket(@file, @acl)
  end

  def public_url
    @s3_file.public_url.to_s
  end

  def set_bucket
   "r3act/uploads/#{Rails.env}/#{@meta_data['parent_model']}/#{@meta_data['parent_model_id']}/#{@model.class.name.downcase}"
  end

  private 
  
  def write_to_bucket(file, acl)
    s3_buckets_objects.write(file, acl)
  end

  def s3_buckets_objects
    @s3.buckets[@bucket].objects["#{@meta_data['file_name']}_#{@meta_data['etag']}.#{@meta_data['extension']}"]
  end

  def set_acl
    {:acl=>:public_read}
  end

end
