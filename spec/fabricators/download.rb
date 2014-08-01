Fabricator(:download) do
  id { sequence(:id) { |id| 1_000_000_000 + id } }
  original_uri { 'http://www.youtube.com/watch?v=uKsx1DRLHf0' }
end

Fabricator(:download_and_convert, from: :download) do
  convert_audio { true }
end
