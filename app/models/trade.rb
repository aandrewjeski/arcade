class Trade < ActiveRecord::Base
  belongs_to :user

  validates :amount, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :trade_type, presence: true
end
