class Creative < ActiveRecord::Base
  has_many :backup_creatives, class_name: "Creative", foreign_key: "main_creative_id"
  belongs_to :main_creative, class_name: "Creative"

  validate :creative_validation
  validate :extension_validation
  before_save :construct_creative
  belongs_to :flight

  def creative_validation
    validate_creative if is_creative
    validate_ad_tag if is_ad_tag
  end
  
  def extension_validation
    if is_creative
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
    parsed_meta_data['tmp_file_path'].split('.').pop if is_creative
  end

  def creative_extension_white_list
    ['swf', 'gif']
  end

  def backup_creative_extension_white_list
    ['jpg', 'jpeg', 'gif', 'png']
  end


	# --- Construct Creative ----------------

  def construct_creative
    if is_creative
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

  private

    def is_creative
      self.creative_type == 'main-creative' || self.creative_type == 'backup-creative'
    end

    def is_ad_tag
      self.creative_type == 'main-ad-tag'
    end

    def validate_ad_tag
      validates_presence_of :ad_tag_code, :width, :height, :name
      
      unless self.width.blank?
        validates_numericality_of :width
      end

      unless self.height.blank?
        validates_numericality_of :height
      end
    end

    def validate_creative
      validates_presence_of :meta_data
    end

end
