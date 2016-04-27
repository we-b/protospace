require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do
  given(:user) { build(:user) }

  scenario 'Create new user and Sign out' do
    # Visit top page
    visit root_path
    click_on 'Get Started'
    # Visit Sign in page
    click_on 'Sign up now'
    # Fill in the blank
    fill_in 'user_name', with: user.name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    fill_in 'user_position', with: user.position
    fill_in 'user_profile', with: user.profile
    fill_in 'user_occupation', with: user.occupation
    # Click submit button
    click_button 'SIGN UP'
    # Check flash message to show sign in successfully
    expect(page).to have_selector '.alert-success', text: 'Welcome! You have signed up successfully.'

    # Click Logout button
    click_on 'Logout'
    # Check flash message to show sign out successfully
    expect(page).to have_selector '.alert-success', text: 'Signed out successfully.'
  end
end
