# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before(:each) do
    @favorite = FactoryBot.create(:favorite)
  end

  it 'has a valid factory' do
    expect(build(:favorite)).to be_valid
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@favorite).to be_a(Favorite)
    end
  end
end

context 'associations' do
  describe 'should belongs_to user' do
    user = FactoryBot.create(:user)
    garden = FactoryBot.create(:garden)
    it { expect(user).to have_many(:favorites) }
    it { expect(garden).to have_many(:favorites) }
  end
end
