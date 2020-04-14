FactoryBot.define do
  factory :pong do
    item1 { "MyString" }
    item2 { "MyString" }
    item3 { "MyString" }
    association :user, factory: :user
    association :ping, factory: :ping
  end
end
