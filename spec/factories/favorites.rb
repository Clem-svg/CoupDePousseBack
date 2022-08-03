# frozen_string_literal: true

FactoryBot.define do
  factory :favorite, class: Favorite do
    user { FactoryBot.create(:user) }
    garden { FactoryBot.create(:garden) }
  end
end
