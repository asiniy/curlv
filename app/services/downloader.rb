class Downloader
  def self.run(download_id)
    @download = Download.find(download_id)

    download
    convert
  end

private

  def download
    video_url = ViddlRb.get_urls(@params[:uri]).last
    video_name = ViddlRb.get_names(@params[:uri]).last

    ViddlRb::DownloadHelper.save_file(video_url, video_name, { save_dir: Rails.root.join('tmp')})
  end

  def convert
    #
  end
end
