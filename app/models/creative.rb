class Creative < ActiveRecord::Base
  validate :presence
  validate :extension_validation
  before_save :construct_creative
  belongs_to :flight

  def presence
    if self.creative_type == 'main-creative' || self.creative_type == 'backup-creative'
      validates_presence_of :meta_data
    end
    if self.creative_type == 'main-ad-tag'
      validates_presence_of :ad_tag_code, :width, :height
      validates_numericality_of :width, :height
    end
  end
  
  def extension_validation
    unless parsed_meta_data.blank?
      set_extension_values
      set_extension_validation
    end
  end

  def set_extension_values
    if self.creative_type == 'main-creative'
      @extension_white_list = creative_extension_white_list
      @extension_error_msg = 'Creative type must be swf or gif'
    end
    if self.creative_type == 'backup-creative'
      @extension_white_list = backup_creative_extension_white_list
      @extension_error_msg = 'Backup image must be jpg, jpeg, gif, or png'
    end
  end

  def set_extension_validation
    unless @extension_white_list.include? extension
      errors.add(:base, @extension_error_msg) 
    end
  end

  def extension
    unless parsed_meta_data.blank?
      parsed_meta_data['tmp_file_path'].split('.').pop
    end
  end

  def creative_extension_white_list
    ['swf', 'gif']
  end

  def backup_creative_extension_white_list
    ['jpg', 'jpeg', 'gif', 'png']
  end


	# --- Construct Creative ----------------

  def construct_creative
    unless parsed_meta_data.blank?
      proccess_creative
      set_attributes
    end
  end

  def proccess_creative
    @processor = CreativeProcessor.new(parsed_meta_data, self)
    @processor.save_to_s3
  end

  def set_attributes
    self.attributes=(@processor.values_hash)
  end
  
  def parsed_meta_data 
    JSON.parse(self.meta_data) if self.meta_data
  end

  def set_creative
    self
  end


end
