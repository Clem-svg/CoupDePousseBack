# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Garden, type: :model do
  before(:each) do
    @garden = FactoryBot.create(:garden)
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@garden).to be_a(Garden)
      expect(@garden).to be_valid
    end

    describe '#title' do
      it 'should be at least 5 characters' do
        invalid_garden = FactoryBot.build(:garden, title: 'aa')
        expect(invalid_garden).not_to be_valid
        expect(invalid_garden.errors.include?(:garden)).to eq(false)
      end
    end

    describe '#description' do
      it 'should be at least 5 characters' do
        invalid_garden = FactoryBot.build(:garden, description: 'aaaa')
        expect(invalid_garden).not_to be_valid
        expect(invalid_garden.errors.include?(:garden)).to eq(false)
      end
    end
  end

  context 'associations' do
    it 'should belongs_to user' do
      user = FactoryBot.create(:user)
      garden = FactoryBot.create(:garden, user: user)
      expect(user.gardens.include?(garden)).to eq(true)
    end
  end
end
