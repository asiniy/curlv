require 'action_view/record_identifier'
require 'open3'

class Downloader
  def self.run(download_id)
    @download = Download.find(download_id).decorate

    download_video
    convert_audio if @download.convert_audio?
  end

private

  def self.download_video
    video_uri = ViddlRb.get_urls(@download.original_uri).last
    video_name = ViddlRb.get_names(@download.original_uri).last.gsub(CarrierWave::SanitizedFile.sanitize_regexp, '_')
    video_dir = Rails.root.join('public', @download.video_file.store_dir)

    FileUtils.mkdir_p video_dir

    File.open(Rails.root.join(video_dir, video_name), 'w+') { |f| f.write Curl.get(video_uri).body_str.force_encoding('UTF-8') }

    @download.video_file.ensure_multipart_form = false
    @download.video_file.store! Rails.root.join(video_dir, video_name)
    @download.save!

    broadcast
  end

  def self.convert_audio
    audio_name = File.basename(@download.video_file.path, @download.video_file.file.extension) + 'mp3'
    audio_dir = Rails.root.join('public', @download.audio_file.store_dir)

    FileUtils.mkdir_p audio_dir

    Open3.popen3("avconv -i #{@download.video_file.path} -ab 128 #{audio_dir}/#{audio_name}") { |stdin, stdout, stderr, wait_thr| stdout.read }

    @download.audio_file.ensure_multipart_form = false
    @download.audio_file.store! Rails.root.join(audio_dir, audio_name)
    @download.save!

    broadcast
  end

  def self.broadcast
    uri = URI.parse('http://localhost:9292/faye')
    Net::HTTP.post_form(uri, message: {
      channel: '/downloads/status_message',
      data: {
        message: @download.status_message,
        id: ActionView::RecordIdentifier.dom_id(@download) },
        ext: { auth_token: ENV['faye_token']
      }
    }.to_json)
  end
end
