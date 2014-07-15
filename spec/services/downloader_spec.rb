require 'rails_helper'

RSpec.describe Downloader do
  let(:download) { Fabricate(:download) }

  it 'load and store just 1 video from youtube' do
    Downloader.run(download.id)

    download.reload

    expect(download[:video_file]).to eq('Кот_красиво_прыгнул.webm')
    expect(Dir.entries(Rails.root.join('public', download.video_file.store_dir)).size).to eq(3)

    download.remove_video_file!
  end
end
