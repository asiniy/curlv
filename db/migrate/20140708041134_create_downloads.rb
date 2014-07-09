class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :original_uri, null: false
      t.string :file_uri, null: false, uniq: true, index: true
      t.string :file, null: false
      t.integer :audio_split_time

      t.timestamps
    end
  end
end
