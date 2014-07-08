class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @user = current_user
    @trades = current_user.trades.last(10)
  end

end
