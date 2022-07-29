# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_a(User)
  end

  describe '#email' do
    it 'should respect email convention' do
      invalid_user = User.create(email: 'johndoehotmail.com', password: 'password', password_confirmation: 'password')
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors.include?(:email)).to eq(true)
    end
  end

  context 'associations' do
    describe 'gardens' do
      it 'should have_many gardens' do
        garden = Garden.create(user_id: @user.id,
                               title: 'Mon jardin',
                               description: 'Charmant jardin à partager, rempli de camélias et myosotis.',
                               orientation: 'Sud',
                               floor_type: 'Sec',
                               is_available: true,
                               parking: true,
                               tools_available: true,
                               surface: 10,
                               street_number: 12,
                               street_name: 'Rue de la rue',
                               zip_code: '78172',
                               city: 'Le Vesinet le Bec',
                               country: 'France')
        expect(@user.gardens.include?(garden)).to eq(true)
      end
    end
  end

  context 'public instance methods' do
    describe '#username' do
      it 'should return a string' do
        expect(@user.get_username).to be_a(String)
      end

      it 'should not be empty' do
        user1 = User.create(email: 'johndoe@hotmail.com', password: 'password', password_confirmation: 'password')
        expect(user1.get_username).to eq('johndoe')
        user2 = User.create(email: 'janedoe@hotmail.com', password: 'password', password_confirmation: 'password')
        expect(user2.get_username).to eq('janedoe')
      end
    end
  end
end
