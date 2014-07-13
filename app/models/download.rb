class Download < ActiveRecord::Base
  validates :original_uri, presence: true, video_uri: true

  mount_uploader :video_file, VideoUploader
end
