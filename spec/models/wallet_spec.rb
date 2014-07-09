require 'rails_helper'

RSpec.describe Wallet, :type => :model do
  it { should belong_to :user }

  describe 'btc_balance' do
    it 'calculates btc balance' do
      wa = FactoryGirl.create(:trade, amount: 1.5, price: 600.0)
      expect(trade.total).to eq 900.0
    end
  end
end
