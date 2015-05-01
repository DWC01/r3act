class AwsS3
    attr_reader :s3, :storageInfo

  def initialize
    @s3 = AWS::S3.new
  end

  def file_path(key)
    storage = parse_key(key)
    s3_file_path(storage)
  end

  def parse_key(key)
    keys = key.split("/")
    {file_name: keys.pop, bucket: "r3act/", key: keys.join("/"), uuid: keys.pop}
  end

  def s3_file_path(storage)
    @s3.buckets[storage[:bucket]+storage[:key]]
       .objects[storage[:file_name]]
       .url_for(:read).to_s
  end

end
