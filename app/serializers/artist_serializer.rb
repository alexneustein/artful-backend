class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name_first, :name_last, :about, :photo, :likes, :created_at

end
