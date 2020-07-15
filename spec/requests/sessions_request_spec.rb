require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before(:each) do
    @user = create(:user)
  end
  describe 'POST /create' do
    it 'returns invalid username error' do
      post '/sessions', params: { user: { username: 'invalid', password: @user.password } }

      parsed_json = JSON(response.body)
      expect(parsed_json['error'][0]).to eq('User does not exist')
    end
    it 'returns invalid username error' do
      post '/sessions', params: { user: { username: @user.username, password: 'invalid' } }

      parsed_json = JSON(response.body)
      expect(parsed_json['error'][0]).to eq('Incorrect Password')
    end
    it 'successfully logs user in using username' do
      post '/sessions', params: { user: { username: @user.username, password: @user.password } }

      parsed_json = JSON(response.body)
      expect(parsed_json['logged_in']).to equal(true)
    end
    it 'successfully logs user in using email' do
      post '/sessions', params: { user: { email: @user.email, password: @user.password } }

      parsed_json = JSON(response.body)
      expect(parsed_json['logged_in']).to equal(true)
    end
  end
end
