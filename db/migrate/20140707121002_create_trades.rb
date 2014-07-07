class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.decimal :price, null: false
      t.decimal :amount, null: false
      t.decimal :price_currency, null: false
      t.string :trade_type, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
