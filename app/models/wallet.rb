class Wallet < ActiveRecord::Base
  has_many :trades
  belongs_to :user

  def btc_total
    if amount == nil || price == nil
      nil
    else
      sql = "SELECT SUM(amount) FROM trades"
      final_amount = ActiveRecord::Base.connection.execute(sql)
      final_amount.to_a.first["sum"].to_d
  end

  def usd_total
    if total == nil
      nil
    else
      starting_amount = 100000
      sql = "SELECT SUM(total) FROM trades"
      final_amount = ActiveRecord::Base.connection.execute(sql)
      final_amount = starting_amount.to_d + final_amount.to_a.first["sum"].to_d
      final_amount
    end
  end
end
