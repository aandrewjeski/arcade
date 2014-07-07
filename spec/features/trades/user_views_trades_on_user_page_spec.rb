require 'rails_helper'

feature 'user views his or her own trades', %Q{
  As a trader
  I want to be able to view my most recent trades
  So that I can keep track of my transactions
} do

  # Acceptance Criteria:
  # * I can see a list of my trades

  let(:user) { FactoryGirl.create(:user) }

  scenario 'User sees a list of memes.' do
    trades = FactoryGirl.create_list(:trade, 3)

    sign_in_as(user)
    visit user_path

    trades.each do |trade|
      expect(page).to have_content(trade.price)
      expect(page).to have_content(trade.amount)
      expect(page).to have_content(trade.price_currency)
      expect(page).to have_content(trade.trade_type)
    end

  end
end


