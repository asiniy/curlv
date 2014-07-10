class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :original_uri, null: false
      t.string :file_uri, index: true
      t.string :file
      t.integer :audio_split_time

      t.timestamps
    end
  end
end
