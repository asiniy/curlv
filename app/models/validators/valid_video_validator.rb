class ValidVideoValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(:attribute, :video_valid, options.merge(value: value)) unless ViddlRb.get_urls(value)
  end
end
