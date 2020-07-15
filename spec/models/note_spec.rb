require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'Note Associations' do
    it { should belong_to(:food) }
  end

  describe 'Validations For Food' do
    let(:note) { build(:note) }
    it 'should validate body\'s presence' do
      note.body = ''
      expect(note.save).to eq(false)
    end
    it 'body\'s length is greater than 3 characters' do
      note.body = 're'
      expect(note.save).to eq(false)
    end
    it 'body\'s length is less than 451 characters' do
      note.body = 'r' * 451
      expect(note.save).to eq(false)
    end
  end

  describe 'Create valid Note' do
    let(:user) { build(:user) }
    let(:food) { build(:food) }
    let(:note) { build(:note) }
    it 'should save Note' do
      food.user_id = user.id
      note.food_id = food.id
      expect(note.save).to eq(true)
    end
  end
end
