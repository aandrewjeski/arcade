require 'rails_helper'

feature 'User deletes account.' do
  scenario 'User successfully deletes account' do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Username', with: user.username
    click_on 'Done'
    expect(User.count).to eq(1)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Done'

    visit edit_user_registration_path

    click_on 'Cancel my account'

    expect(page).to have_content('deleted')
    expect(User.count).to eq(0)
  end
end
