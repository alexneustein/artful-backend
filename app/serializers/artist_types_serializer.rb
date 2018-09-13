class ArtistTypesSerializer < ActiveModel::Serializer
  attributes :id, :name_first, :name_last, :email, :about, :photo, :likes, :created_at, :types

  def types
      object.types.map do |type_obj|
        type_obj["type_name"]
      end
    end
end
