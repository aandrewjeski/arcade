class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.integer :user_id
      t.decimal :balance_btc
      t.decimal :balance_usd

      t.timestamps
    end
  end
end
