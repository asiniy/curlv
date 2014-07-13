class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :original_uri, null: false
      t.string :video_file # VideoUploader

      t.timestamps
    end
  end
end
