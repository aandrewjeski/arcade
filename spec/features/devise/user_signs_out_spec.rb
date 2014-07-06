require 'rails_helper'

feature 'User signs out.' do
  scenario 'User clicks on sign out' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'

    expect(page).to have_content('Signed in successfully.')

    click_on 'Sign Out'

    expect(page).to have_content('Signed out successfully.')
  end

end
