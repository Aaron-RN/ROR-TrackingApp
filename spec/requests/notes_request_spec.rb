require 'rails_helper'

RSpec.describe 'Notes', type: :request do
  before(:each) do
    @user = create(:user)

    post '/sessions', params: { user: { username: @user.username, password: @user.password } }
    expect(JSON(response.body)['logged_in']).to equal(true)

    food = attributes_for(:food)
    food2 = attributes_for(:food2)

    post '/foods', params: { food: food }
    expect(JSON(response.body)['selected_food'].fetch('name')).to eq(food[:name])
    @food = JSON(response.body)['selected_food']

    post '/foods', params: { food: food2 }
    expect(JSON(response.body)['selected_food'].fetch('name')).to eq(food2[:name])
    @food2 = JSON(response.body)['selected_food']

    note = attributes_for(:note)
    post "/foods/#{@food.fetch('id')}/notes", params: { note: note }
    @note = JSON(response.body)['note']
  end

  describe 'POST /create' do
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH /update' do
    it 'returns http ok' do
      patch "/foods/#{@food.fetch('id')}/notes/#{@note.fetch('id')}",
            params: { note: { body: 'I retract my previous comment, the salt was just right!' } }

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http ok' do
      delete "/foods/#{@food.fetch('id')}/notes/#{@note.fetch('id')}"

      expect(response).to have_http_status(:ok)
    end
  end
end
