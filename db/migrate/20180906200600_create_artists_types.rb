class CreateArtistsTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :artists_types do |t|
      t.integer :artist_id
      t.integer :type_id
    end
  end
end
