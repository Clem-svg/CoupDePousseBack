# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  before(:each) do
    @appointment = FactoryBot.create(:appointment)
  end

  it 'has a valid factory' do
    expect(build(:appointment)).to be_valid
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@appointment).to be_a(Appointment)
    end
    describe 'guest' do
      it { expect(@appointment).to validate_presence_of(:guest) }
    end
    describe 'host' do
      it { expect(@appointment).to validate_presence_of(:host) }
    end
    describe 'garden' do
      it { expect(@appointment).to validate_presence_of(:garden) }
    end
  end
end

context 'associations' do
  describe 'should belongs_to garden, guest and host' do
    host = FactoryBot.create(:user)
    guest = FactoryBot.create(:user)
    garden = FactoryBot.create(:garden)
    it { expect(host).to have_many(:appointments) }
    it { expect(guest).to have_many(:appointments) }
    it { expect(garden).to have_many(:appointments) }
  end
end
