require 'rails_helper'

RSpec.describe Downloader do
  before do
    WebMock.disable_net_connect!(allow: /.com/)
    stub_request(:any, 'http://localhost:9292/faye').to_return(success: true)
  end

  after do
    WebMock.allow_net_connect!
  end

  let(:download) { Fabricate(:download) }
  let(:converted) { Fabricate(:download_and_convert) }

  it 'load and store just 1 video from youtube' do
    Downloader.run(download.id)

    download.reload

    expect(download[:video_file]).to eq('Кот_красиво_прыгнул.webm')
    expect(download[:audio_file]).to be_blank
    expect(Dir.entries(Rails.root.join('public', download.video_file.store_dir)).size).to eq(3)

    download.remove_video_file!
  end

  it 'load and gives the audio' do
    Downloader.run(converted.id)

    converted.reload

    expect(converted[:audio_file]).to eq('Кот_красиво_прыгнул.mp3')
    expect(Dir.entries(Rails.root.join('public', converted.audio_file.store_dir)).size).to eq(3)

    download.remove_video_file!
    download.remove_audio_file!
  end
end
