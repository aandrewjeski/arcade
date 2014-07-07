class ChangeColumnConstraintsInTrades < ActiveRecord::Migration
  def change
    change_column :trades, :price, :decimal, :null => true
    change_column :trades, :price_currency, :decimal, :null => true
  end
end
