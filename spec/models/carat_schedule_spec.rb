require "spec_helper"
 
describe CaratSchedule do
  
  let(:csv_1) {CaratSchedule.new("https://s3-us-west-1.amazonaws.com/r3act/uploads/test/schedule_1.xls")}
  let(:csv_2) {CaratSchedule.new("https://s3-us-west-1.amazonaws.com/r3act/uploads/test/schedule_2.xlsx")}
  let(:csv_3) {CaratSchedule.new("https://s3-us-west-1.amazonaws.com/r3act/uploads/test/schedule_3.xlsx")}

  context "CSV 1" do
    
    context "Header" do
      it "#set_header_row_index shoud return index if header row" do
        index = csv_1.set_header_row_index(csv_1.csv)        
        expect(index).to eq(6)
      end
      context "#set_header" do
        it "returns 'total_cost' as last value" do
          expect(csv_1.header.last).to eq("total_cost")
        end
      end
    end
   
    context "Campaign Basics" do
      let(:basics) {csv_1.set_campaign_basics(csv_1.all_rows)}
      context "#set_campaign_basics" do 
        it "returns correct Advertiser" do
          expect(basics["advertiser"]).to eq("XYZ")
        end
        it "returns correct Product" do
          expect(basics["product"]).to eq("Retail")
        end
        it "returns correct Period" do
          expect(basics["period"]).to eq("FY14/15")
        end
        it "returns correct PTA" do
          expect(basics["primary_target_audience"]).to eq("People 25 - 54 years")
        end
        it "returns correct Date" do
          expect(basics["date"]).to eq("2014-11-30")
        end
        it "returns correct Version" do
          expect(basics["version"]).to eq("5.0")
        end
      end
    end
  end

  context "CSV 2" do
    
    context "Header" do
      it "#set_header_row_index shoud return index if header row" do
        index = csv_2.set_header_row_index(csv_2.csv)        
        expect(index).to eq(6)
      end
      context "#set_header" do
        it "returns 'total_cost' as last value" do
          expect(csv_1.header.last).to eq("total_cost")
        end
      end
    end

    context "Campaign Basics" do
      let(:basics) {csv_2.set_campaign_basics(csv_2.all_rows)}
      context "#set_campaign_basics" do 
        it "returns correct Advertiser" do
          expect(basics["advertiser"]).to eq("")
        end
        it "returns correct Product" do
          expect(basics["product"]).to eq("")
        end
        it "returns correct Period" do
          expect(basics["period"]).to eq("FY1415")
        end
        it "returns correct PTA" do
          expect(basics["primary_target_audience"]).to eq("P25-54 years")
        end
        it "returns correct Date" do
          expect(basics["date"]).to eq("24.10.2014")
        end
        it "returns correct Version" do
          expect(basics["version"]).to eq("5.0")
        end
      end
    end
  end

  context "CSV 3" do
    
    context "Header" do
      it "#set_header_row_index shoud return index if header row" do
        index = csv_3.set_header_row_index(csv_3.csv)        
        expect(index).to eq(1)
      end
      context "#set_header" do
        it "returns 'total_cost' as last value" do
          expect(csv_1.header.last).to eq("total_cost")
        end
      end
    end

    context "Campaign Basics" do
      let(:basics) {csv_3.set_campaign_basics(csv_3.all_rows)}
      context "#set_campaign_basics" do 
        it "returns correct Advertiser" do
          expect(basics["advertiser"]).to eq(nil)
        end
        it "returns correct Product" do
          expect(basics["product"]).to eq(nil)
        end
        it "returns correct Period" do
          expect(basics["period"]).to eq(nil)
        end
        it "returns correct PTA" do
          expect(basics["primary_target_audience"]).to eq(nil)
        end
        it "returns correct Date" do
          expect(basics["date"]).to eq(nil)
        end
        it "returns correct Version" do
          expect(basics["version"]).to eq(nil)
        end
      end
    end
  end

end