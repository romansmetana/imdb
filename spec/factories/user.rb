# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password { 'password' }

    trait :admin do
      admin { true }
    end
  end
end
