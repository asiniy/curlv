RSpec.configure do |config|
  config.before(:each) do
    # video player page
    stub_request(:get, 'http://player.vimeo.com/video/96030980').
      to_return(status: 200, body: File.open('spec/fixtures/vimeo/video.html'))

    # vimeo video file
    stub_request(:get, 'http://pdl.vimeocdn.com/45203/146/272102135.mp4?aksessionid=08c5ea31acb4bc32&token2=1406887743_6026764dac1aa637c642de64c73dc7f5').
      to_return(status: 200, body: File.open('spec/fixtures/youtube/Кот_красиво_прыгнул.webm'))
  end
end
