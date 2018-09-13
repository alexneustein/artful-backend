class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name_first, :name_last, :email, :about, :photo, :likes, :created_at

end
