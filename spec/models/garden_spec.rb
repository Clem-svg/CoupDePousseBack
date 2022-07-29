# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Garden, type: :model do
  before(:each) do
    @garden = FactoryBot.create(:garden)
  end

  it 'has a valid factory' do
    expect(build(:garden)).to be_valid
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@garden).to be_a(Garden)
    end
    describe '#title' do
      it { expect(@garden).to validate_presence_of(:title) }
    end
    describe '#description' do
      it { expect(@garden).to validate_presence_of(:description) }
    end
    describe '#street_number' do
      it { expect(@garden).to validate_presence_of(:street_number) }
    end
    describe '#street_name' do
      it { expect(@garden).to validate_presence_of(:street_name) }
    end
    describe '#street_name' do
      it { expect(@garden).to validate_presence_of(:street_name) }
    end
    describe '#city' do
      it { expect(@garden).to validate_presence_of(:city) }
    end
    describe '#country' do
      it { expect(@garden).to validate_presence_of(:country) }
    end

    describe '#title' do
      it { expect(@garden).to validate_length_of(:title).is_at_least(5) }
    end

    describe '#description' do
      it { expect(@garden).to validate_length_of(:description).is_at_least(20) }
    end
  end

  context 'associations' do
    describe 'should belongs_to user' do
      user = FactoryBot.create(:user)
      it { expect(user).to have_many(:gardens) }
    end
  end
end
