class Wallet < ActiveRecord::Base
  belongs_to :user

  def update_wallet

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
