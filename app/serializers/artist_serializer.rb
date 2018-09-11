class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name_first, :name_last, :about, :photo, :likes, :created_at
  has_many :types
  has_many :images
end
