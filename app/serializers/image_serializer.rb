class ImageSerializer < ActiveModel::Serializer
  attributes :id, :artist_id, :image_date, :details, :imagedata, :title, :likes, :url, :artist
  # belongs_to :artist


def artist
    object.artist.full_name
  end
end
