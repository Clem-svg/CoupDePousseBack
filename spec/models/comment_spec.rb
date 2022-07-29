# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @comment = FactoryBot.create(:comment)
  end

  it 'has a valid factory' do
    expect(build(:comment)).to be_valid
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@comment).to be_a(Comment)
    end
    describe '#content' do
      it { expect(@comment).to validate_presence_of(:content) }
    end
  end
end

context 'associations' do
  describe 'should belongs_to user' do
    user = FactoryBot.create(:user)
    garden = FactoryBot.create(:garden)
    it { expect(user).to have_many(:comments) }
    it { expect(garden).to have_many(:comments) }
  end
end
