FactoryBot.define do
  factory :canvas do
    sequence(:title) { |n| "テストキャンバス#{n}" }
    association :owner, factory: :user
  end
end