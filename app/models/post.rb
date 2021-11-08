class Post < ApplicationRecord
    validates_presence_of :title, :content, :user_email
    has_many :comments

    validates   :user_email,
                format: { with: URI::MailTo::EMAIL_REGEXP }
    
    default_scope { order(created_at: :desc)}

    after_initialize :init

    def init
      self.likes_count ||= 0
      self.dislikes_count ||= 0
      self.comments_count ||= 0
    end
end
