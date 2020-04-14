FactoryBot.define do
  factory :user do
    role { 'user' }
    email { "user#{rand(1...9999)}@mail.com" }
    password { 'password' }
    password_confirmation { 'password' }
    name { 'Betty' }
  end
  factory :admin do
    role { 'admin' }
  end
   
end
