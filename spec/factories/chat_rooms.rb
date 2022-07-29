FactoryBot.define do
  factory :chat_room, class: ChatRoom do
    sender { FactoryBot.create(:user) }
    receiver { FactoryBot.create(:user) }
    title { 'Hello there' }
  end
end
