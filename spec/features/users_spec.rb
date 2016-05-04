require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do 
  given(:user) { build(:user) }
  given(:login_user) { create(:user) }
  given(:prototype) { build(:prototype, :with_sub_images) }

  scenario 'Create new user and Sign out', js: true do
    def sign_up(user)
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
    end
    # Visit top page
    visit root_path
    click_on 'Get Started'
    # Visit Sign in page
    click_on 'Sign up now'
    # Sign up
    sign_up(user)
    # Check flash message to show sign in successfully
    expect(page).to have_selector '.alert-success', text: 'Welcome! You have signed up successfully.'
    # Click dropdown toggle
    click_on user.name
    # Click Logout button
    page.evaluate_script('$(".dropdown").addClass("open")')
    click_on 'Logout'
    # Check flash message to show sign out successfully
    expect(page).to have_selector '.alert-success', text: 'Signed out successfully.'
  end

  scenario 'Login and Post prototype', js: true do
    def sign_in(user)
      # Login
      fill_in 'inputEmail', with: login_user.email
      fill_in 'inputPassword', with: login_user.password
      # Click Sign in button
      click_button 'Sign in'
    end


    def post_prototype_by(user)
      find('#prototype_user_id', visible: false).set(prototype.user.id)
      fill_in 'prototype_title', with: prototype.title
      fill_in 'prototype_catch_copy', with: prototype.catch_copy
      fill_in 'prototype_concept', with: prototype.concept
      attach_file 'prototype[captured_images_attributes][0][content]', File.join(Rails.root, '/spec/factories/img/sample.png'),  visible: false
      1.upto(3) do |i|
        attach_file "prototype[captured_images_attributes][#{i}][content]", File.join(Rails.root, '/spec/factories/img/sample.png'), visible: false
      end
      click_on 'PUBLISH'
    end

    # Visit top page
    visit root_path
    click_on 'Get Started'
    # Sign in user
    sign_in(user)
    # Check flash message to show sign in successfully
    expect(page).to have_selector '.alert-success', text: 'Signed in successfully.'
    # Click New photo button
    click_on 'New Photo'
    # Post prototype
    post_prototype_by(user)
    # Check flash message to create prototype successfully
    expect(page).to have_selector '.alert-success', text: 'New prototype was successfully created'
  end
end
