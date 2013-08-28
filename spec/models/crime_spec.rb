require "spec_helper"

describe Crime do
  it "has a valid factory" do
    FactoryGirl.create(:crime).should be_valid
  end

  it "is invalid without a latitude" do
    FactoryGirl.build(:crime, lat: nil).should_not be_valid
  end
  
  it "is invalid without a longitude" do
    FactoryGirl.build(:crime, lng: nil).should_not be_valid
  end
end
