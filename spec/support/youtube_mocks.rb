RSpec.configure do |config|
  config.before(:each) do
    # youtube ciphers
    stub_request(:any, 'https://raw.githubusercontent.com/rb2k/viddl-rb/master/plugins/youtube/ciphers.yml').
      to_return(status: 200, body: File.open('spec/fixtures/youtube/github-ciphers.yml'))

    # youtube video page
    stub_request(:get, 'http://www.youtube.com/watch?v=uKsx1DRLHf0').
      to_return(status: 200, body: File.open('spec/fixtures/youtube/video1.html'))

    # youtube html5player
    stub_request(:get, 'http://s.ytimg.com/yts/jsbin/html5player-ru_RU-vflN_XtBI/html5player.js').
      to_return(status: 200, body: File.open('spec/fixtures/youtube/html5player.js'))

    # youtube video file
    stub_request(:get, 'http://r8---sn-n8v7sn7k.googlevideo.com/videoplayback?expire=1406909843&fexp=902408,910100,924613,927622,929305,934024,934030,946013&id=o-AJ1jI2GgxwF5g5-xbQEmgjELokt0JQT9ykcnl6FoR2QV&initcwndbps=1493000&ip=217.119.26.170&ipbits=0&itag=43&key=yt5&mm=31&ms=au&mt=1406888187&mv=m&mws=yes&ratebypass=yes&signature=308600B6F0E46803314DE96800CC7F0FE65C89C8.62BD76BD5221A46AF220BF83635A675AF78A1E5A&source=youtube&sparams=id,initcwndbps,ip,ipbits,itag,ratebypass,source,upn,expire&sver=3&upn=xkCXekxx_OU').
      to_return(status: 200, body: File.open('spec/fixtures/youtube/Кот_красиво_прыгнул.webm'))
  end
end
