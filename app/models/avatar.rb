class Avatar < ActiveRecord::Base
  before_save :construct_avatar
  belongs_to :user

  # --- Construct Avatar ----------------

  def construct_avatar
    proccess_images
    set_attributes
  end

  def proccess_images
    @processor = AvatarProcessor.new(self.user_id, parsed_s3_data)
    @processor.proccess_imgs_save_to_s3
  end

  def set_attributes
    self.attributes=(@processor.values_hash)
  end
  
  def parsed_s3_data 
    JSON.parse(self.s3_data) if self.s3_data
  end
  
end
