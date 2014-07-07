require 'rails_helper'
require 'spec_helper'

describe Contact do
  it "has a valid factory" do
    Factory(:trade).should be_valid
  end

  it "is invalid without an amount" do
    Factory.build(:trade, amount: nil).should_not be_valid
  end

  it "is invalid without a user id" do
    Factory.build(:trade, user_id: nil).should_not be_valid
  end

  it "is invalid without a lastname" do
    Factory.build(:trade, trade_type: nil).should_not be_valid
  end

end
