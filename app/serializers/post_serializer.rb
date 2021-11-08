class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_email, :likes_count, :dislikes_count, :comments_count, :created_at
end
