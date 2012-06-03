class ItemImageUploader < CarrierWave::Uploader::Base

  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

end
