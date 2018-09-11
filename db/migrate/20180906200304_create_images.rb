class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :artist_id
      t.date :image_date
      t.text :details
      t.string :url
      t.binary :imagedata
      t.string :title
      t.integer :likes

      t.timestamps
    end
  end
end
