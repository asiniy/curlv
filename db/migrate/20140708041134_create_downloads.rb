class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :original_uri, null: false
      t.string :original_name, null: false
      t.string :service_name, null: false
      t.string :video_file # VideoUploader
      t.boolean :convert_audio, null: false, default: false
      t.string :audio_file # AudioUploader

      t.timestamps
    end
  end
end
