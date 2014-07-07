class AddDefaultValueToTradePrice < ActiveRecord::Migration
  def change
    change_column :trades, :price, :decimal, :null => true, default: 600
  end
end
