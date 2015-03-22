require 'rails_helper'

describe User, :type => :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it { should validate_presence_of    :first_name }
  it { should validate_presence_of    :password }
  it { should validate_presence_of    :email }
  it { should validate_uniqueness_of  :email }
end
