FactoryBot.define do
  factory :canvas_member do
    association :canvas
    association :user
  end
end