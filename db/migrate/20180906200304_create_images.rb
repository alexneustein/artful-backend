class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.date :image_date
      t.text :details
      t.binary :imagedata
      t.string :title
      t.integer :likes

      t.timestamps
    end
  end
end
