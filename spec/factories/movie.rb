# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    trait :valid_params do
        title { 'The Shawshank Redemption' }
        description { 'Test description for movie!' }
        category { 1 }
      end
      
      trait :invalid_params do
        title { nil }
        description { nil }
        category { nil }
      end

  end
end
