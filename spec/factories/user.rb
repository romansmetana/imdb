FactoryBot.define do
    factory :user do
      nickname {'test'}
      email { 'test@test.com' }
      password { 'password' }
    end
  end