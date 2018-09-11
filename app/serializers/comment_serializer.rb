class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :author, :image_id, :created_at, :likes
end
