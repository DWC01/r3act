require "spec_helper"
 
describe Campaign, :type => :model do
  it "should have a factory" do
    expect(build(:campaign)).to be_valid
  end

  it { should have_many(:flights) }
end