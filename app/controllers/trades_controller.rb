class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index

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
    if @trade.trade_type == "buy" && current_user.wallet.usd_total >= @trade.total && @trade.save
      redirect_to user_path(current_user), notice: "Your transaction was successfully processed."
      @trade.update_price
      @trade.update_total_usd
    elsif @trade.trade_type == "sell" && current_user.wallet.btc_total >= @trade.amount && @trade.save
      redirect_to user_path(current_user), notice: "Your transaction was successfully processed."
      @trade.update_price
      @trade.update_total_usd
    else
      redirect_to user_path(current_user), notice: "We were unable to process your transaction."
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
