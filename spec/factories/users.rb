FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "bob#{n}@bigbob.com"}
    password '12345678'
    password_confirmation '12345678'
    sequence(:username) {|n| "coinmaster#{n}"}
  end
end
