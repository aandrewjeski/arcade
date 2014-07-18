class UsersController < ApplicationController
  # before_action :set_user, only: [:show]

  def show
    @user = current_user
    @wallet = @user.wallet
    @trades = @wallet.trades.order(created_at: :desc).limit(10)
  end

end
