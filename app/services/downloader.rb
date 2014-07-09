class Downloader
  def initialize(params = {})
    @params = params
  end

  def run
    @download = Download.new()


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
