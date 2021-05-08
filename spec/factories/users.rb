FactoryBot.define do
  factory :user do
    name { 'yamada' }
    sequence(:email) { |n| "sample#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
    password_confirmation { password }
  end
end