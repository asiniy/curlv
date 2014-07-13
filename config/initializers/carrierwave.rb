CarrierWave.configure do |config|
  config.root = Rails.root
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^a-zA-Z0-9а-яА-Я\.\-\+_]/
