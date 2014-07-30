class DownloadsController < ApplicationController
  def index
    @download = Download.new
    @downloads = Download.last(10).reverse
  end

  def create
    @download = Download.new(download_params)
    @downloads = Download.last(10).reverse

    if @download.save
      Downloader.delay.run(@download.id)
      redirect_to @download
    else
      render :index
    end
  end

  def show
    @download = Download.find(params[:id]).decorate
  end

private

  def download_params
    params.require(:download).permit(:original_uri, :convert_audio)
  end
end
