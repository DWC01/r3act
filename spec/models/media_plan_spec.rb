require "spec_helper"
 
describe MediaPlan do
  
  let(:media_plan1) {MediaPlan.new("https://s3-us-west-1.amazonaws.com/r3act/uploads/test/media_plan.xls")}

  context "Media Plan 1" do
    
    context "Header" do
      xit "#set_header_row_index shoud return index if header row" do
        index = media_plan1.set_header_row_index(media_plan1.csv)        
        expect(index).to eq(6)
      end
      context "#set_header" do
        xit "returns 'total_cost' as last value" do
          expect(media_plan1.header.last).to eq("total_cost")
        end
      end
    end
   
    context "Campaign Basics" do
      let(:basics) {media_plan1.set_campaign_basics(media_plan1.all_rows)}
      context "#set_campaign_basics" do 
        xit "returns correct Advertiser" do
          expect(basics["advertiser"]).to eq("XYZ")
        end
        xit "returns correct Product" do
          expect(basics["product"]).to eq("Retail")
        end
        xit "returns correct Period" do
          expect(basics["period"]).to eq("FY14/15")
        end
        xit "returns correct PTA" do
          expect(basics["primary_target_audience"]).to eq("People 25 - 54 years")
        end
        xit "returns correct Date" do
          expect(basics["date"]).to eq("2014-11-30")
        end
        xit "returns correct Version" do
          expect(basics["version"]).to eq("5.0")
        end
      end
    end
  end

end