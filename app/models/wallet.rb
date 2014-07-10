class Wallet < ActiveRecord::Base
  has_many :trades
  belongs_to :user

  # def update_btc_balance
  #   if self.trades.trade_type == 'buy'
  #     self.update(balance_btc: self.trades.sum(:amount))
  #   else
  #     self.update(balance_btc: self.trades.)
  # end
  def btc_total
    sql = "SELECT SUM(amount) FROM trades"
    final_amount = ActiveRecord::Base.connection.execute(sql)
    final_amount.to_a.first["sum"].to_d
  end

  def usd_total
    starting_amount = 100000
    sql = "SELECT SUM(total) FROM trades"
    final_amount = ActiveRecord::Base.connection.execute(sql)
    final_amount = starting_amount.to_d - final_amount.to_a.first["sum"].to_d
    final_amount.to_d
  end

  # def update_btc_balance!
  #   if trade_type == 'buy'
  #     @btc_balance += @amount
  #   elsif trade_type == 'sell'
  #     @btc_balance -= @amount
  #   end
  # end

  # def update_usd_balance!
  #   if trade_type == 'buy'
  #    @usd_balance -= @total
  #   elsif trade_type == 'sell'
  #    @usd_balance += @total
  #  end
  # end


  # def balance
  #   self.trades.sum(:amount)
  # end

end


# current_user.wallet.balance
