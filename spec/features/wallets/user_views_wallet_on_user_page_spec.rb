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
      wallet = FactoryGirl.create(:wallet, balance_btc: 0.0, balance_usd: 750)
      trade = FactoryGirl.create(:trade, amount: 1.5, price: 500, trade_type: "buy", wallet: wallet)

      sign_in_as(wallet.user)
      visit user_path(wallet.user)

      expect(page).to have_content(wallet.btc_total)
      expect(page).to have_content(wallet.usd_total)

    end
  end
end
