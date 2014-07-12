class Trade < ActiveRecord::Base
  belongs_to :user
  belongs_to :wallet

  validates :amount, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :trade_type, presence: true

  def calculate_total_usd
    if trade_type == "buy"
      amount * price * -1
    else
      amount * price
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
