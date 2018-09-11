class CommentSerializer < ActiveModel::Serializer
  attributes :comment, :author, :image_id, :created_at, :likes
end
