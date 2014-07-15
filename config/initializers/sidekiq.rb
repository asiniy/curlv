Sidekiq.configure_server do |config|
  config.redis = { namespace: 'curlv' }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: 'curlv' }
end
