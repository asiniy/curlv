class Download < ActiveRecord::Base
  validates :original_uri, :file_uri, :file, presence: true
  validates :file_uri, uniqueness: true

end
