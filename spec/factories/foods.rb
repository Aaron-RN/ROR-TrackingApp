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
  factory :food2, class: Food do
    association :user
    name { 'Spaghetti' }
    date_consumed { '2020-07-04' }
    servings_consumed { 1 }
    carbs { 18.0 }
    fats { 1.0 }
    proteins { 10.0 }
  end
end
