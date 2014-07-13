class DownloadsController < ApplicationController
  def index
    @downloads = Download.last(20)
  end

  def create
    @download = Download.new(download_params)

    if @download.save
      Downloader.delay.run(@download.id)
      redirect_to @download
    else
      render :index
    end
  end

  def show
    @download = Download.find(params[:id])
  end

private

  def download_params
    params.require(:download).permit!(:original_uri)
  end
end
