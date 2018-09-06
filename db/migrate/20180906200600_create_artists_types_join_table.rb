class CreateArtistsTypesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :artists, :types do |t|
      t.index :artist_id
      t.index :type_id
    end
  end
end
