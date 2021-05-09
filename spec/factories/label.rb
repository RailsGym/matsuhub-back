FactoryBot.define do
  factory :label do
    association :area
    association :canvas
    association :created_user, factory: :user
    title { 'テスト' }
    sequence(:position) { |n| n }
  end
end