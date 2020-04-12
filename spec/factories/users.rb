FactoryBot.define do
  factory :user do
    role { "admin" }
    email { "admin@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
