class Downloader
  def self.run(download_id)
    @download = Download.find(download_id)

    download_video
    # convert TODO convert audio to video online
  end

private

  def self.download_video
    video_uri = ViddlRb.get_urls(@download.original_uri).last
    video_name = ViddlRb.get_names(@download.original_uri).last.gsub(CarrierWave::SanitizedFile.sanitize_regexp, '_')
    FileUtils.mkdir_p @download.video_file.store_dir

    ViddlRb::DownloadHelper.save_file(video_uri, video_name, { save_dir: @download.video_file.store_dir })

    @download.video_file.ensure_multipart_form = false
    @download.video_file.store! Rails.root.join(@download.video_file.store_dir, video_name)
    @download.save!
  end
end
