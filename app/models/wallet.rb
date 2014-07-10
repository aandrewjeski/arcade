class Wallet < ActiveRecord::Base
  has_many :trades
  belongs_to :user

  def btc_total
    sql = "SELECT SUM(amount) FROM trades"
    final_amount = ActiveRecord::Base.connection.execute(sql)
    final_amount.to_a.first["sum"].to_d
  end

  def usd_total
    starting_amount = 100000
    sql = "SELECT SUM(total) FROM trades"
    final_amount = ActiveRecord::Base.connection.execute(sql)
    final_amount = starting_amount.to_d + final_amount.to_a.first["sum"].to_d
    final_amount
  end
end
