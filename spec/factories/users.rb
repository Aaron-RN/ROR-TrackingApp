FactoryBot.define do
  factory :user do
    username { 'TestUser' }
    email { 'testuser@test.com' }
    password { 'asdfg' }
    password_confirmation { 'asdfg' }
  end
end
