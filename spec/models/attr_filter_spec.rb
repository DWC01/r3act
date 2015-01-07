require "spec_helper"

describe AttrFilter do

  it "#campaign_basics returns the correct value" do
    brand = AttrFilter.campaign_basics("brand:")
    pta = AttrFilter.campaign_basics("pta:")

    expect(brand).to eq("advertiser")
    expect(pta).to eq("primary_target_audience")
  end

  it "#header returns the correct value" do
    total_cost = AttrFilter.header("total cost")
    placement_name = AttrFilter.header("product / detail")

    expect(total_cost).to eq("total_cost")
    expect(placement_name).to eq("placement_name")
  end

end