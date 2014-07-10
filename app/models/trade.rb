class Trade < ActiveRecord::Base
  belongs_to :user
  belongs_to :wallet

  validates :amount, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :trade_type, presence: true

  def calculate_total
    binding.pry
    if trade_type == 'buy'
      amount * price * -1
    else
      amount * price
    end
  end

  def update_total
    update(total: calculate_total)
  end

end
