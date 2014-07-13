class VideoUriValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :video_uri, options.merge(value: value)) unless (ViddlRb.get_urls(value) rescue false)
  end
end
