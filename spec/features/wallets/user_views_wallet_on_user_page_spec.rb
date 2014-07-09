require 'rails_helper'

feature 'user views his or her own wallet', %Q{
  As a trader
  I want to be able to view my balances and profits
  So that I can keep track of my money
} do

  context 'as an authenticated user' do
    let(:user) { FactoryGirl.create(:user) }

    # Acceptance Criteria:
      # * I can view a list of recent trades

    scenario 'User sees a list of trades.' do
      wallet = FactoryGirl.create_list(:wallet)

      sign_in_as(user)
      visit user_path(user)

      expect(page).to have_content(wallet.balance_btc)
      expect(page).to have_content(wallet.balance_usd)
      expect(page).to have_content(wallet.profits)

    end
  end
end
