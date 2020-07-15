require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'POST /create' do
    it 'returns account could not be created' do
      user = { username: 'test', email: 'test@test.com',
               password: 'asdfghjk', password_confirmation: 'invalid' }

      post '/registrations', params: { user: user }

      parsed_json = JSON(response.body)
      expect(parsed_json['message']).to eq('Account could not be created!')
      expect(parsed_json['error'][0]).to eq("Password confirmation doesn't match Password")
    end
    it 'successfully creates user' do
      user = { username: 'test', email: 'test@test.com',
               password: 'asdfghjk', password_confirmation: 'asdfghjk' }

      post '/registrations', params: { user: user }
      parsed_json = JSON(response.body)
      expect(parsed_json['status']).to eq('created')
    end
  end
end
