require 'action_view/record_identifier'
include ActionView::RecordIdentifier

class Downloader
  def self.run(download_id)
    @download = Download.find(download_id).decorate

    download_video
    # convert TODO convert audio to video online
  end

private

  def self.download_video
    video_uri = ViddlRb.get_urls(@download.original_uri).last
    video_name = ViddlRb.get_names(@download.original_uri).last.gsub(CarrierWave::SanitizedFile.sanitize_regexp, '_')
    video_dir = Rails.root.join('public', @download.video_file.store_dir)

    FileUtils.mkdir_p video_dir

    ViddlRb::DownloadHelper.save_file(video_uri, video_name, { save_dir: video_dir })

    @download.video_file.ensure_multipart_form = false
    @download.video_file.store! Rails.root.join(video_dir, video_name)
    @download.save!

    broadcast
  end

  def self.broadcast
    message = { channel: '/downloads/status_message', data: { message: @download.status_message, id: dom_id(@download) }, ext: { auth_token: ENV['faye_token'] }}
    uri = URI.parse('http://localhost:9292/faye')
    Net::HTTP.post_form(uri, message: message.to_json)
  end
end
