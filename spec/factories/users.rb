# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    role { 'user' }
    email { "user#{rand(1...9999)}@mail.com" }
    password { 'password' }
    password_confirmation { 'password' }
    name { 'Betty' }
    community_status { 'accepted' }
    association :community, factory: :community
    
    factory :admin do
      role { 'admin' }
    end
  end
end
