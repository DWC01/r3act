class CreativeProcessor
  attr_reader :values_hash

  def initialize(meta_data, file)
    @meta_data = meta_data
    @file = file
  end

  # def proccess_backup_img
  #   @img = Magick::Image::read(@meta_data['tmp_file_path']).first
  #   @width = @img.columns
  #   @height = @img.rows
  #   @dimensions = "#{@width}x#{@height}"
  #   @creative = @img.to_blob
  # end

  # def proccess_ad_tag
  #   @creative = @model.ad_tag_code.to_s
  #   @meta_data['file_name'] = @model.name
  #   @meta_data['extension'] = 'txt'
  # end

end