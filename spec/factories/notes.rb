FactoryBot.define do
  factory :note do
    association :food
    body { 'This food was absolutely tasty!' }
  end
  factory :note2 do
    association :food
    body { 'Was a little salty but still tasted great!' }
  end
end
