class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]

  def index
    @trades = Trade.last(10)
  end

  def show
    @trade = Trade.find(params[:id])
  end

  def new
    @trade = Trade.new
  end

  def create
    @trade = current_user.trades.build(trade_params)
    if @trade.save
      redirect_to @trade, notice: 'Your transaction was successfully processed.'
    else
      render action: 'new'
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
