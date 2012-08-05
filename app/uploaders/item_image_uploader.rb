class ItemImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  process :auto_orient
  process :resize_to_limit => [800, 800]

  version :thumb do
    process :resize_to_fit => [100,100]
  end

  def auto_orient
    manipulate! do |img|
      img.auto_orient
      img
    end
  end

end
