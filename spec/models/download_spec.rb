require 'rails_helper'

RSpec.describe Download, type: :model do
  it 'validates video uri' do
    %w{
      http://www.youtube.com/watch?v=uKsx1DRLHf0
      http://vimeo.com/96030980
    }.each do |video_uri|
      expect(Fabricate.build(:download, original_uri: video_uri)).to be_valid
    end

    %w{
      vk.com
      youtube.com
      mmablog.ru
      asiniy.ru
    }.each do |invalid_video_uri|
      expect(Fabricate.build(:download, original_uri: invalid_video_uri)).to be_invalid
    end
  end

  it 'set right filename' do
    download = Fabricate(:download)

    expect(download.original_name).to eq('Кот красиво прыгнул')
    expect(download.service_name).to eq('Youtube')
  end
end
