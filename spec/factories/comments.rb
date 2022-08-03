# frozen_string_literal: true

FactoryBot.define do
  factory :comment, class: Comment do
    user { FactoryBot.create(:user) }
    garden { FactoryBot.create(:garden) }
    content { Faker::Quote }
  end
end
