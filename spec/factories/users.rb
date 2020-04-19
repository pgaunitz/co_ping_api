# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    role { 'user' }
    email { "user#{rand(1...9999)}@mail.com" }
    password { 'password' }
    password_confirmation { 'password' }
    name { 'Betty' }
    community_status { 'accepted' }
    adress { 'Baconstreet 37, floor 2' }
    phone_number { '123456789' }
    about_me { 'I love bacon' }
    association :community, factory: :community
    
    factory :admin do
      role { 'admin' }
    end
  end
end
