# frozen_string_literal: true

FactoryBot.define do
  factory :rating do
    trait :valid_rating do
      rating { 8 }
      association :movie, :valid_params
      association :user
    end

    trait :not_integer do
      rating { 'test' }
      association :movie, :valid_params
      association :user
    end

    trait :rating_in do
      rating { 20 }
      association :movie, :valid_params
      association :user
    end
  end
end
