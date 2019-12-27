class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  process resize_to_limit: Settings.uploader.resize_to_limit

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    Settings.uploaders.extension_whitelist
  end
end
