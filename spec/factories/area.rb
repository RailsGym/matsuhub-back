FactoryBot.define do
  factory :area do
    area_type { 'purpose' }
    area_type_text { '目的' }
    description { 'われわれはなぜこの事業をやるのか？' }
  end
end