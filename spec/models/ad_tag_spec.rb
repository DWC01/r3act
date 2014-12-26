require "spec_helper"
 
describe AdTag do
  it "should have a factory" do
    expect(FactoryGirl.build(:ad_tag)).to be_valid
  end
end