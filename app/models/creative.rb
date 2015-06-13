class Creative < ActiveRecord::Base
	before_save :construct_creative
	belongs_to :flight

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
