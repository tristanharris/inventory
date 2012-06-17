class ItemImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  process :resize_to_limit => [800, 800]

  version :thumb do
    process :resize_to_fit => [100,100]
  end

end
