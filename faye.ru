require 'faye'
require 'yaml'
require 'active_support/core_ext/object/try'

ENV['auth_token'] = YAML::load_file(File.join(__dir__, 'config/application.yml'))['faye_token']

class ServerAuth
  def incoming(message, callback)
    if message['channel'] !~ %r{^/meta/}
      if message.try(:[], 'ext').try(:[], 'auth_token') != ENV['auth_token']
        message['error'] = 'Invalid authentication token.'
      end
    end
    callback.call(message)
  end
end

Faye::WebSocket.load_adapter('thin')
faye_server = Faye::RackAdapter.new(mount: '/faye', timeout: 45)
faye_server.add_extension(ServerAuth.new)
run faye_server
