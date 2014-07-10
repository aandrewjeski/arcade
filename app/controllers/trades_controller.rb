class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @trades = Trade.last(10)
  end

  def show
    @trade = Trade.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @trade = Trade.new
  end

  def create
    @trade = current_user.trades.build(trade_params)
    @trade.wallet = current_user.default_wallet
    @trade.update_total_USD
    @trade.update_total_BTC
    if @trade.save
      redirect_to user_path(current_user), notice: 'Your transaction was successfully processed.'
    else
      redirect_to user_path(current_user), notice: 'Sorry, we were unable to process your transaction. Please try again.'
    end
  end

  private

    def set_trade
      @trade = Trade.find(params[:id])
    end

    def correct_user
      @trade = current_user.trades.find_by(id: params[:id])
      redirect_to trades_path, notice: "Not authorized to trade." if @trade.nil?
    end

    def trade_params
      params.require(:trade).permit(:price, :amount, :price_currency, :trade_type)
    end
end
