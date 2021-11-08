FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    user_email { Faker::Internet.email }
    likes_count { Faker::Number.number(digits: 2) }
    dislikes_count { Faker::Number.number(digits: 2) }
  end
end
