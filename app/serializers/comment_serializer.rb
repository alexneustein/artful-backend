class CommentSerializer < ActiveModel::Serializer
  attributes :comment, :author, :image_id
end
