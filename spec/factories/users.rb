FactoryBot.define do
  factory :user do
    role { 'user' }
    email { 'admin@mail.com' }
    password { 'password' }
    password_confirmation { 'password' }
    name { 'Betty' }
  end
  factory :admin do
    role { 'admin' }
  end
end
