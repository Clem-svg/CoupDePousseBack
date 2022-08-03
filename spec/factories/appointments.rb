# frozen_string_literal: true

FactoryBot.define do
  factory :appointment, class: Appointment do
    guest { FactoryBot.create(:user) }
    host { FactoryBot.create(:user) }
    garden { FactoryBot.create(:garden) }
    message_contact { Faker::Quote }
    start_date { '2022-10-03 01:29:18' }
    end_date { '2022-10-04 01:29:18' }
  end
end
