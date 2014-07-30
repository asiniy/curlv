class DownloadDecorator < Draper::Decorator
  delegate_all

  def status_message
    if object.convert_audio?
      if object.audio_file.present?
        h.link_to('Load audio', object.audio_file_url)
      elsif object.video_file.present?
        "Video loaded. Please wait while audio converted. BTW, #{h.link_to 'video link', object.video_file_url}"
      else
        "Not loaded yet. Please wait"
      end
    else
      if object.video_file.present?
        "Load your video #{h.link_to object.video_file_url, object.video_file_url}"
      else
        "Not loaded yet. Please wait"
      end
    end
  end
end
