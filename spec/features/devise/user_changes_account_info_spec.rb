require 'rails_helper'

feature 'User edits account info.' do
  scenario 'User enters valid email, username,
  new password and confirmation, and old password.' do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Username', with: user.username
    click_on 'Done'

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Done'

    visit edit_user_registration_path

    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    fill_in 'Current password', with: user.password
    fill_in 'Username', with: 'coinmaster'
    click_on 'Update'

    expect(page).to have_content('Sucess')
    updated_user = User.where(email: 'user@gmail.com').first
    expect(updated_user.username).to eq('coinmaster')
  end

  scenario 'User enters an invalid password.' do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Username', with: user.username
    click_on 'Done'

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Done'

    visit edit_user_registration_path

    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '123'
    fill_in 'Current password', with: user.password
    fill_in 'Username', with: 'coinmaster'
    click_on 'Update'

    expect(page).to have_content('too short')
    updated_user = User.first
    expect(updated_user.email).to_not eq('user@gmail.com')
  end

  scenario 'Passwords don\'t match.' do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Username', with: user.username
    click_on 'Done'

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Done'

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

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Username', with: user.username
    click_on 'Done'

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Done'

    visit edit_user_registration_path

    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: '12345678910'
    fill_in 'Password confirmation', with: '12345678910'
    fill_in 'Current password', with: user.password
    fill_in 'Username', with: 'c'
    click_on 'Update'

    expect(page).to have_content('too short')
    updated_user = User.first
    expect(updated_user.email).to_not eq('user@gmail.com')
  end

end
