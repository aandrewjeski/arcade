require 'rails_helper'

RSpec.describe Trade, :type => :model do
  it { should belong_to :user }

  it { should have_valid(:price).when(600.0) }
  it { should_not have_valid(:price).when(nil, '') }

  it { should have_valid(:amount).when(1.0) }
  it { should_not have_valid(:amount).when(nil, '') }

  it { should have_valid(:trade_type).when('buy') }
  it { should_not have_valid(:trade_type).when(nil, '') }

  it { should have_valid(:user_id).when(1) }
  it { should_not have_valid(:user_id).when(nil, '') }

  describe 'total' do
    it 'calculates total' do
      trade = FactoryGirl.create(:trade, amount: 1.5, price: 600.0)
      expect(trade.total).to eq 900.0
    end
  end
end


