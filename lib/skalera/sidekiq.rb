Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://172.16.57.179:6379/0' }
end

