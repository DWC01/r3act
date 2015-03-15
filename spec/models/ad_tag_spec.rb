require "spec_helper"
 
describe AdTag do
  it "should have a factory" do
    expect(build(:ad_tag)).to be_valid
  end

  it { should belong_to(:flight) }
end