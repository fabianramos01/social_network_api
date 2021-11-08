class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_email
end
