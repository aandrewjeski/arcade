require 'rails_helper'

feature 'user signs up', %Q{
  As a user
  I want to be able to sign up
  So that I can use this website
} do

  # Acceptance Criteria:
  # * I can sign up with a username, email, and password

feature 'User signs up successfully.' do
  scenario 'User enters a valid username and password.' do
    visit new_user_registration_path

    fill_in 'Username', with: 'coinmaster1'
    fill_in 'Email', with: 'bob@bigbob.com'
    fill_in 'Password', with: '1234567890'
    fill_in 'Password confirmation', with: '1234567890'
    click_on 'Sign Up'

    user = User.where(email: 'bob@bigbob.com').first
    expect(User.count).to eq(1)
    expect(user.username).to eq('coinmaster1')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'Username wrong length.' do
    visit new_user_registration_path

    fill_in 'Email', with: 'bob@bigbob.com'
    fill_in 'Password', with: '1234567890'
    fill_in 'Password confirmation', with: '1234567890'
    fill_in 'Username', with: 'd'
    click_on 'Sign Up'

    expect(User.count).to eq(0)
    expect(page).to_not have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('too short')
  end

end
