class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name_first
      t.string :name_last
      t.string :username
      t.string :password
      t.text :about
      t.binary :photo
      t.integer :likes, :default => 0

      t.timestamps
    end
  end
end
