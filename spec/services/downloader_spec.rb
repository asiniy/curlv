require 'rails_helper'

RSpec.describe Downloader do
  let(:download) { Fabricate(:download) }

  it 'load and store just 1 video from youtube' do
    Downloader.run(download.id)

    download.reload

    expect(download[:video_file]).to eq('Кот_красиво_прыгнул.webm')
    expect(download[:audio_file]).to be_blank
    expect(Dir.entries(Rails.root.join('public', download.video_file.store_dir)).size).to eq(3)

    download.remove_video_file!
  end

  let(:converted) { Fabricate(:download_and_convert) }

  it 'load and gives the audio' do
    Downloader.run(converted.id)

    converted.reload

    expect(converted[:audio_file]).to eq('music.mp3')

    download.remove_video_file!
  end
end
