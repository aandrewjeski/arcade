require 'rails_helper'

feature 'user views his or her own trades', %Q{
  As a trader
  I want to be able to view my most recent trades
  So that I can keep track of my transactions
} do

  context 'as an authenticated user' do
    let(:user) { FactoryGirl.create(:user) }

    # Acceptance Criteria:
      # * I can create a trade

    scenario 'User sees a list of trades.' do
      trades = FactoryGirl.create_list(:trade, 3)

      sign_in_as(user)
      visit user_path(user)

      trades.each do |trade|
        expect(page).to have_content(trade.price)
        expect(page).to have_content(trade.amount)
        expect(page).to have_content(trade.price_currency)
        expect(page).to have_content(trade.trade_type)
        expect(page).to have_content(trade.created_at)
      end
    end
  end
end


