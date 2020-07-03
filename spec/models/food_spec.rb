require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Food Associations' do
    it { should have_many(:notes) }
  end

  describe 'Validations For Food' do
    let(:food) { build(:food) }
    it 'should validate name\'s presence' do
      food.name = ''
      expect(food.save).to eq(false)
    end
    it 'should validate date_consumed is present' do
      food.date_consumed = ''
      expect(food.save).to eq(false)
    end
    it 'servings consumed should be 1 or more' do
      food.servings_consumed = 0
      expect(food.save).to eq(false)
    end
    it 'carbs should be 0 or more' do
      food.carbs = -1
      expect(food.save).to eq(false)
    end
    it 'fats should be 0 or more' do
      food.fats = -1
      expect(food.save).to eq(false)
    end
    it 'proteins should be 0 or more' do
      food.proteins = -1
      expect(food.save).to eq(false)
    end
  end

  describe 'Create valid Food' do
    let(:user) { build(:user) }
    let(:food) { build(:food) }
    it 'should save Food' do
      food.user_id = user.id
      expect(food.save).to eq(true)
    end
  end
end
