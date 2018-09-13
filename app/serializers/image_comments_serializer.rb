class ImageCommentsSerializer < ActiveModel::Serializer
  attributes :id, :artist_id, :image_date, :details, :imagedata, :title, :likes, :url
  has_many :comments
  belongs_to :artist
end
