# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@test.com' }
    password { 'password' }
   
    trait :admin do
      admin { true }
    end

  end
end
