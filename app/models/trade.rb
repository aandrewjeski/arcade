class Trade < ActiveRecord::Base
  after_create :update_wallet

  belongs_to :user
  belongs_to :wallet

  validates :amount, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :trade_type, presence: true

  def calculate_total
    if trade_type == 'buy'
      amount * price * -1
    else
      amount * price
    end
  end

  def update_wallet

  end

end
