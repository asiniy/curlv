class VideoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/video/#{model.id}"
  end

  def extension_white_list
    %w(mp4 flv avi webm 3gp)
  end
end
