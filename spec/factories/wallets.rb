FactoryGirl.define do
  factory :wallet do
    balance_btc "1.00"
    balance_usd "660.00"
    user
  end
end
