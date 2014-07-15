class DownloadDecorator < Draper::Decorator
  delegate_all

  def status_message
    if object.video_file.present?
      "Load your video #{h.link_to object.video_file_url, object.video_file_url}"
    else
      "Not loaded yet. Please wait"
    end
  end
end
