require 'rails_helper'

feature 'User signs in.' do
  scenario 'User enters a valid email and password. Success!' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'User enters an invalid email.' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: 'wrong@email.com'
    fill_in 'Password', with: user.password
    click_on 'Sign In'

    expect(page).to_not have_content('Signed in successfully.')
    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'User enters an invalid password.' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'guessagain'
    click_on 'Sign In'

    expect(page).to_not have_content('Signed in successfully.')
    expect(page).to have_content('Invalid email or password.')
  end

end
