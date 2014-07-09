class Trade < ActiveRecord::Base
  after_create :update_wallet

  belongs_to :user
  belongs_to :wallet

  validates :amount, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :trade_type, presence: true

  def find_total
    price.to_s.to_d * amount.to_s.to_d
  end

  def update_amount
    if trade_type = 'buy'
      amount +=
    else
      amount -=
    end
  end

  def update_wallet

  end

end
