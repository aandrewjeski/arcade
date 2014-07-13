require 'rails_helper'

feature 'user signs out', %Q{
  As a user
  I want to be able to sign out
  So that I can switch accounts or leave the site
} do

  # Acceptance Criteria:
  # * I can successfully sign out of a user session

  scenario 'User clicks on sign out' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Signed in successfully.')

    click_on 'Sign Out'

    expect(page).to have_content('Signed out successfully.')
  end

end
