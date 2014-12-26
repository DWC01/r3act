class AdTagsFileUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    if Rails.env.test?
      "uploads/test/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    elsif Rails.env.production?
      "uploads/production/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/development/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end 

end
