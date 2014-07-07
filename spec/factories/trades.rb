# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trade do
    price 600
    amount 1.0
    price_currency 600
    trade_type 'buy'
  end
end
