class UsersController < ApplicationController
  # before_action :set_user, only: [:show]

  def show
    @user = current_user
    @trades = Trade.order(created_at: :asc).limit(10)
    @wallet = current_user.wallet
  end

end
