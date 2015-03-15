require "spec_helper"
 
describe Flight do
  it "should have a factory" do
    expect(build(:flight)).to be_valid
  end

  it { should belong_to(:campaign) }
  it { should have_many(:ad_tags) }
end