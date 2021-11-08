class PostDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_email, :likes_count, :dislikes_count, :comments_count, :created_at
  has_many :comments
end
