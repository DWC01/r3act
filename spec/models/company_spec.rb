require 'rails_helper'

describe Company, :type => :model do
  it "has a valid factory" do
    expect(build(:company)).to be_valid
  end

  it { should have_many(:users) }
  it { should have_many(:campaigns) }
end
