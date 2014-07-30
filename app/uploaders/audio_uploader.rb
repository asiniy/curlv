class AudioUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/audio/#{model.id}"
  end

  def extension_white_list
    %w(mp3)
  end
end
