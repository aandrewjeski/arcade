FactoryGirl.define do
  factory :trade do
    user
    price 600
    amount 1.0
    trade_type 'buy'
  end
end
