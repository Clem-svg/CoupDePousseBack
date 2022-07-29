# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  before(:each) do
    @chat_room = FactoryBot.create(:chat_room)
  end

  it 'has a valid factory' do
    expect(build(:chat_room)).to be_valid
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@chat_room).to be_a(ChatRoom)
    end
    describe 'sender' do
      it { should belong_to(:sender) }
    end
    describe 'receiver' do
      it { should belong_to(:receiver) }
    end
    describe 'title' do
      it { expect(@chat_room).to validate_presence_of(:title) }
    end
  end
end

# context 'associations' do
#   describe 'should belongs_to ' do
#     user = FactoryBot.create(:user)
#     receiver = FactoryBot.create(:user)
#     # it { expect(receiver).to have_many(:chat_rooms) }

#   end
# end

# def pen_pal(user)
#   if user.id == sender_id
#     receiver.get_username
#   else
#     sender.get_username
#   end
# end
