require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  before(:each) do
    @user = create(:user)

    post '/sessions', params: { user: { username: @user.username, password: @user.password } }

    food = attributes_for(:food)
    food2 = attributes_for(:food2)

    post '/foods', params: { food: food }
    @food = JSON(response.body)['selected_food']

    post '/foods', params: { food: food2 }
    @food2 = JSON(response.body)['selected_food']
  end

  describe 'POST /create' do
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /index' do
    it 'returns list of food related to Logged in User' do
      get '/foods'
      expect(JSON(response.body).length).to eq(2)
    end
  end

  describe 'GET /show' do
    it 'returns selected food' do
      get "/foods/#{@food.fetch('id')}"

      expect(response).to have_http_status(:ok)
      expect(JSON(response.body)['selected_food'].fetch('name')).to eq(@food.fetch('name'))
    end
  end

  describe 'PATCH /update' do
    it 'returns updated food item' do
      patch "/foods/#{@food2.fetch('id')}", params: { food: { name: 'Ramen Noodle' } }

      expect(JSON(response.body)['selected_food'].fetch('name')).to eq('Ramen Noodle')
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys selected food and returns updated food list' do
      delete "/foods/#{@food.fetch('id')}"

      expect(response).to have_http_status(:ok)
      expect(JSON(response.body)['food'].length).to eq(1)
    end
  end
end
