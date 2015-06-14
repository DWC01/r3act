class Creative < ActiveRecord::Base
  validate :extension_type
	before_save :construct_creative
	belongs_to :flight


  # --- Custom Validation ----------------
  
  def extension
    parsed_meta_data['tmp_file_path'].split('.').pop
  end

  def extension_type
    unless ['jpg', 'jpeg', 'gif', 'png'].include? extension
      errors.add(:extension, 'File type must be jpg, jpeg, gif, png') 
    end

  end

	# --- Construct Creative ----------------

  def construct_creative
    proccess_images
    set_attributes
  end

  def proccess_images
    @processor = CreativeProcessor.new(parsed_meta_data)
    @processor.proccess_imgs_save_to_s3
  end

  def set_attributes
    self.attributes=(@processor.values_hash)
  end
  
  def parsed_meta_data 
    JSON.parse(self.meta_data) if self.meta_data
  end
end
