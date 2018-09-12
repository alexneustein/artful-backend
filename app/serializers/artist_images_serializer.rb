class ArtistImagesSerializer < ActiveModel::Serializer
  attributes :id, :name_first, :name_last, :about, :photo, :likes, :created_at, :types
  has_many :images

  def types
      object.types.map do |type_obj|
        type_obj["type_name"]
      end
    end
end
