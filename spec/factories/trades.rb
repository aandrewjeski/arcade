FactoryGirl.define do
  factory :trade do
    user
    price 600
    amount 1.5
    trade_type 'buy'
    wallet
  end
end
