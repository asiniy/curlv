RSpec.configure do |config|
  config.after(:each) do
    %w(public/uploads/audio public/uploads/video).each do |dir_path|
      FileUtils.mkdir_p Rails.root.join(dir_path)

      Dir.entries(Rails.root.join(dir_path)).each do |subdir_name|
        FileUtils.rm_rf(Rails.root.join(dir_path, subdir_name)) if subdir_name.length > 9
      end
    end
  end

end
