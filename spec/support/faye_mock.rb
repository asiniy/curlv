RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, 'http://localhost:9292/faye').to_return(success: true)
  end
end
