# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the signup process', type: :feature do
  before :each do
    User.make(email: 'user@example.com', password: 'password')
  end

  it 'signs me in' do
    visit '/users/new'

    within('#user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'PasswordConfirmation', with: 'password'
    end

    click_button 'Sign in'

    expect(page).to have_content 'Success'
  end
end
