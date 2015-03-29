require 'sidekiq'
require 'diplomat'

consul = ENV['CONSUL'] || 'consul'

begin
  Diplomat.configuration.url = ("http://#{consul}:8500")
  redis = Diplomat::Service.get('redis')
rescue Faraday::ConnectionFailed
  STDERR.puts("ERROR: could not lookup host #{consul}")
  exit(1)
rescue Faraday::ResourceNotFound
  STDERR.puts("ERROR: could not lookup consul service redis")
  exit(1)
end

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{redis.Address}:#{redis.ServicePort}/0"}
end
