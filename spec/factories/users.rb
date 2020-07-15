FactoryBot.define do
  factory :user do
    username { 'TestUser' }
    email { 'testuser@test.com' }
    password { 'asdfghjk' }
    password_confirmation { 'asdfghjk' }
  end
end
