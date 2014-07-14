require 'rails_helper'

RSpec.describe Download, type: :model do
  it 'validates video uri' do
    %w{
      http://www.youtube.com/watch?v=CmKhGNrR0RQ#t=173
      http://vimeo.com/96030980
      http://www.youtube.com/watch?v=uKsx1DRLHf0
    }.each do |video_uri|
      expect(Fabricate.build(:download, original_uri: video_uri)).to be_valid
      expect(Fabricate(:download, original_uri: video_uri).persisted?).to eq(true)
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
end
