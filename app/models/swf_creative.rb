class SwfCreative < ActiveRecord::Base
  belongs_to :creative
  after_initialize :set_meta_data
  before_save :proccess_swf_creative
  validate :validate_extension

  # --- validate ------

  def validate_extension
    unless @meta_data['extension'] === 'swf'
      errors.add(:base, 'File upload must be a swf') 
    end
  end

  # --- proccess creative ------

  def proccess_swf_creative
    set_swf_file
    save_swf_to_S3
    set_attributes
  end

  def save_swf_to_S3
    @S3 = AwsS3.new(@meta_data, @s3_file, 'swf_creative')
    @S3.save_to_s3
  end

  def set_attributes
    self.attributes=({
      url:  @S3.public_url,
      name:  @meta_data['name'],
      size:  @swf_file.size,
      etag:  @meta_data['etag'],
      width:  @swf_file.width,
      height:  @swf_file.height,
      version:  @swf_file.version,
      swf_xmax:  @swf_file.xmax,
      swf_ymax:  @swf_file.ymax,
      duration:  @swf_file.duration,
      signature:  @swf_file.signature,
      bit_count:  @swf_file.bit_count,
      extension:  @meta_data['extension'],
      meta_data:  @meta_data,
      mime_type:  @meta_data['mime_type'],
      frame_rate:  @swf_file.frame_rate,
      compressed:  @swf_file.compressed?,
      frame_count:  @swf_file.frame_count,
      avm_version:  @swf_file.avm_version,
      creative_id:  1, # TODO
      creative_type:  'main',
      creative_landing_page: 'http://www.google.com' # TODO
    })
  end

  private

    def set_swf_file
      @s3_file = open(@meta_data['tmp_file_path'])
      @swf_file = SwfFile::FlashFile.header(@s3_file)

      puts @swf_file
      puts @swf_file.size
      puts @swf_file.compressed?
      puts @swf_file.version
      puts @swf_file.bit_count
      puts @swf_file.xmax
      puts @swf_file.ymax
      puts @swf_file.width # In pixels
      puts @swf_file.height # In pixels
      puts @swf_file.frame_rate
      puts @swf_file.frame_count
      puts @swf_file.duration # In milliseconds
      puts @swf_file.avm_version
      puts @swf_file.signature
    end

    def set_meta_data 
      @meta_data = JSON.parse(self.meta_data) if self.meta_data
      @meta_data['file_name'] = @meta_data['name'].split('.').shift
      @meta_data['extension'] = @meta_data['name'].split('.').pop
      @meta_data['etag'] = @meta_data['etag'].gsub("\"","")
    end
      
end