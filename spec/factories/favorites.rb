FactoryBot.define do
    factory :favorite, class: Favorite do
      user { FactoryBot.create(:user) }
      garden { FactoryBot.create(:garden) }
    end
  end