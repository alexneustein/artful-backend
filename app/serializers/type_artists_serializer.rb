class TypeArtistsSerializer < ActiveModel::Serializer
  attributes :type_name
  has_many :artists
end
