class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @trades = current_user.trades.last(10)
  end

end
