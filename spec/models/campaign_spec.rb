require "spec_helper"
 
describe Campaign do
  it "should have a factory" do
    expect(FactoryGirl.build(:campaign)).to be_valid
  end
end