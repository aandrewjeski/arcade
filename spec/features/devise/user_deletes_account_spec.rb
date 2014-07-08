require 'rails_helper'

feature 'user deletes his or her account', %Q{
  As a user
  I want to be able to delete my account
  So that I my information is removed from the site
} do

  # Acceptance Criteria:
  # * I can cancel my account

feature 'User deletes account.' do
  scenario 'User successfully deletes account' do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Username', with: user.username
    click_on 'Sign Up'
    expect(User.count).to eq(1)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'

    visit edit_user_registration_path

    click_on 'Cancel my account'

    expect(page).to have_content('Bye! Your account was successfully cancelled. We hope to see you again soon.')
    expect(User.count).to eq(0)
  end
end
