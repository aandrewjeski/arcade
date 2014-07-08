class Trade < ActiveRecord::Base
  belongs_to :user

  validates :amount, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :trade_type, presence: true

  def total
    price.to_s.to_d * amount.to_s.to_d
  end

end
