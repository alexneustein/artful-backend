class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name_first
      t.string :name_last
      t.string :username
      t.string :password_digest
      t.integer :type
      t.text :about
      t.binary :photo
      t.integer :likes

      t.timestamps
    end
  end
end
