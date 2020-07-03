FactoryBot.define do
  factory :food do
    association :user
    name { 'RiceBall' }
    date_consumed { '2020-07-03' }
    servings_consumed { 1 }
    carbs { 15.0 }
    fats { 0.5 }
    proteins { 2.5 }
  end
end
