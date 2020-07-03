FactoryBot.define do
  factory :note do
    association :food
    body { 'This food was absolutely tasty!' }
  end
end
