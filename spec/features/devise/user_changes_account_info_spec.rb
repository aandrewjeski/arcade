require 'rails_helper'

feature 'user changes his or her account details', %Q{
  As a user
  I want to be able to edit my account
  So that I can update my contact information
} do

  # Acceptance Criteria:
  # * I can change my username
  # * I can change my email
  # * I can change my password

  scenario 'User enters valid email, username,
  new password and confirmation, and old password.' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'

    visit edit_user_registration_path

    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'

    fill_in 'Current password', with: user.password
    fill_in 'Username', with: 'coinmaster1'
    click_on 'Update'

    expect(page).to have_content('You updated your account successfully.')
    updated_user = User.where(email: 'user@gmail.com').first
    expect(updated_user.username).to eq('coinmaster1')
  end

  scenario 'User enters an invalid password.' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'

    visit edit_user_registration_path

    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '123'
    fill_in 'Current password', with: user.password
    fill_in 'Username', with: 'coinmaster'
    click_on 'Update'

    expect(page).to have_content('Password is too short')
    updated_user = User.first
    expect(updated_user.email).to_not eq('user@gmail.com')
  end

  scenario 'Passwords don\'t match.' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'

    visit edit_user_registration_path

    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: '12345678910'
    fill_in 'Password confirmation', with: '10987654321'
    fill_in 'Current password', with: user.password
    fill_in 'Username', with: 'coinmaster'
    click_on 'Update'

    expect(page).to have_content('doesn\'t match')
    updated_user = User.first
    expect(updated_user.email).to_not eq('user@gmail.com')
  end

  scenario 'User enters an invalid username.' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'

    visit edit_user_registration_path

    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Current password', with: user.password
    fill_in 'Username', with: 'c'
    click_on 'Update'

    expect(page).to have_content('too short')
    updated_user = User.first
    expect(updated_user.email).to_not eq('user@gmail.com')
  end

end
