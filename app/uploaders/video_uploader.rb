class VideoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "public/uploads/video/#{model.id}" # see config/initializers/carrierwave.rb
  end

  def extension_white_list
    %w(mp4 flv avi webm 3gp)
  end
end
