class AddWalletIdToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :wallet_id, :integer
  end
end
