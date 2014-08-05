class Download < ActiveRecord::Base
  validates :original_uri, presence: true, video_uri: true

  mount_uploader :video_file, VideoUploader
  mount_uploader :audio_file, AudioUploader

  before_save do
    self.original_name = ViddlRb.get_names(self.original_uri).last.split('.')[0..-2].join

    self.service_name = ViddlRb::PluginBase
      .registered_plugins.find { |p| p.matches_provider?(original_uri) }.to_s.split('::').last
  end
end
