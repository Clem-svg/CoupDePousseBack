# frozen_string_literal: true

FactoryBot.define do
  factory :garden, class: Garden do
    user { FactoryBot.create(:user) }
    title { 'Mon jardin' }
    description { 'Charmant jardin à partager, rempli de camélias et myosotis.' }
    orientation { 'Sud' }
    floor_type { 'Sec' }
    is_available { true }
    parking { true }
    tools_available { true }
    surface { 10 }
    street_number { 12 }
    street_name { 'Rue de la rue' }
    zip_code { '78172' }
    city { 'Le Vesinet le Bec' }
    country { 'France' }
  end
end
