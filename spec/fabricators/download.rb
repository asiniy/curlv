Fabricator(:download) do
  original_uri { 'http://www.youtube.com/watch?v=uKsx1DRLHf0' }
end

Fabricator(:download_and_convert, from: :download) do
  convert_audio { true }
end
