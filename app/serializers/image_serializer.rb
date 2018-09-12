class ImageSerializer < ActiveModel::Serializer
  attributes :id, :artist_id, :image_date, :details, :imagedata, :title, :likes, :url
  belongs_to :artist
end
