require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do 
  given(:user) { build(:user) }
  given(:login_user) { create(:user) }
  given(:prototype) { build(:prototype, :with_sub_images) }

  scenario 'Create new user', js: true do
    def sign_up(user)
      fill_in 'user_name', with: user.name
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      fill_in 'user_position', with: user.position
      fill_in 'user_profile', with: user.profile
      fill_in 'user_occupation', with: user.occupation
      click_button 'SIGN UP'
    end
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    sign_up(user)
    expect(page).to have_selector '.alert-success', text: 'Welcome! You have signed up successfully.'
  end

  scenario 'Login and Post prototype', js: true do
    def sign_in(user)
      fill_in 'inputEmail', with: login_user.email
      fill_in 'inputPassword', with: login_user.password
      click_button 'Sign in'
    end


    def post_prototype_by(user)
      find('#prototype_user_id', visible: false).set(login_user.id)
      fill_in 'prototype_title', with: prototype.title
      fill_in 'prototype_catch_copy', with: prototype.catch_copy
      fill_in 'prototype_concept', with: prototype.concept
      attach_file 'prototype[captured_images_attributes][0][content]', File.join(Rails.root, '/spec/factories/img/sample.png'),  visible: false
      1.upto(3) do |i|
        attach_file "prototype[captured_images_attributes][#{i}][content]", File.join(Rails.root, '/spec/factories/img/sample.png'), visible: false
      end
      click_on 'PUBLISH'
    end

    visit root_path
    click_on 'Get Started'
    sign_in(user)
    expect(page).to have_selector '.alert-success', text: 'Signed in successfully.'
    click_on 'New Photo'
    post_prototype_by(user)
    expect(page).to have_selector '.alert-success', text: 'New prototype was successfully created'
  end
end
