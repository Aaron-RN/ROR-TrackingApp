require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Associations' do
    it { should have_many(:foods) }
  end

  describe 'Validations For User' do
    let(:user) { build(:user) }
    it 'should validate user\'s username presence' do
      user.username = ''
      expect(user.save).to eq(false)
    end
    it 'should validate user email presence' do
      user.email = ''
      expect(user.save).to eq(false)
    end
  end

  describe 'Create valid User' do
    let(:user) { build(:user) }
    it 'should save User' do
      expect(user.save).to eq(true)
    end
  end
end
