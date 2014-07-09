class AddTotalToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :total, :decimal
  end
end
