class Wallet < ActiveRecord::Base
  has_many :trades
  belongs_to :user

  def btc_total
    total = 0
    self.trades.each do |trade|
       total += trade.calculate_total_btc
    end
    return total
  end

  def usd_total
    total = 100000
    self.trades.each do |trade|
       total += trade.calculate_total_usd
    end
    return total
  end
end
