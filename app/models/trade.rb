require 'btce'

class Trade < ActiveRecord::Base
  belongs_to :user
  belongs_to :wallet

  validates :amount, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :trade_type, presence: true

  def find_price
    ticker = Btce::Ticker.new "btc_usd"
    ticker.avg
  end

  def update_price
    update(price: find_price)
  end

  def calculate_total_usd
    ticker = Btce::Ticker.new "btc_usd"
    if trade_type == "buy"
      amount * ticker.avg * -1
    else
      amount * ticker.avg
    end
  end

  def update_total_usd
    update(total: calculate_total_usd)
  end

  def calculate_total_btc
    if trade_type == "buy"
      amount
    else
      amount * -1
    end
  end

  def update_total_btc
    update(amount: calculate_total_btc)
  end

end
