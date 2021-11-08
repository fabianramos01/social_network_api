class Comment < ApplicationRecord  
  validates_presence_of :title, :content, :user_email
  belongs_to :post
  
  default_scope { order(created_at: :desc)}

  validates   :user_email,
                format: { with: URI::MailTo::EMAIL_REGEXP }

end
