class Trade < ActiveRecord::Base
  belongs_to :user
  belongs_to :wallet

  validates :amount, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :trade_type, presence: true

  def calculate_total_USD
    if amount == nil || price == nil
      nil
    else
      if trade_type == 'buy'
        amount * price * -1
      else
        amount * price
      end
    end
  end

  def update_total_USD
    update(total: calculate_total_USD)
  end

  def calculate_total_BTC
    if amount == nil || price == nil
      nil
    else
      if trade_type == 'buy'
        amount
      else
        amount * -1
      end
    end
  end

  def update_total_BTC
    update(amount: calculate_total_BTC)
  end

end
