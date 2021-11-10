class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_email, :created_at
end
