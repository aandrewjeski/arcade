require 'rails_helper'

RSpec.describe Wallet, :type => :model do
  it { should belong_to :user }

  describe 'usd_total' do
    it 'calculates usd total' do
      wallet = FactoryGirl.create(:wallet, balance_btc: 0.0, balance_usd: 500.0)
      trade = FactoryGirl.create(:trade, amount: 1, price: 500.0, trade_type: "buy", total: 500.0, wallet: wallet)

      expect(trade.wallet.usd_total).to eql(99500)
    end
  end

  describe 'btc_total' do
    it 'calculates btc total' do
      wallet = FactoryGirl.create(:wallet, balance_btc: 0.0, balance_usd: 750)
      trade = FactoryGirl.create(:trade, amount: 1.5, price: 500, trade_type: "buy", wallet: wallet)

      expect(trade.wallet.btc_total).to eql(1.5)
    end
  end
end
