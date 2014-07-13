require 'rails_helper'

feature 'user makes a trade', %Q{
  As a trader
  I want to be able to buy or sell coins
  So that I can make money
} do
  context 'as an authenticated user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as(user)
    end

    # Acceptance Criteria:
      # * I can create a trade

    scenario 'User creates a valid trade' do
      trade = FactoryGirl.create(:trade)
      visit new_user_trade_path(user)

      fill_in 'Amount', with: trade.amount
      find_field('Trade type').value.should eq 'buy'
      click_on 'Submit'

      expect(page).to have_content(trade.price)
      expect(page).to have_content('1.5')
      expect(page).to have_content(trade.total)
      expect(page).to have_content(trade.trade_type)
      expect(page).to have_content(trade.created_at)
      expect(page).to have_content('Your transaction was successfully processed.')
    end

    scenario 'User doesn\'t fill in form' do
      visit new_user_trade_path(user)
      click_on 'Submit'
      expect(page).to have_content('We were unable to process your transaction.')
    end
  end
end
