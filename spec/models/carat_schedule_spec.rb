require "spec_helper"
 
describe CaratSchedule do
  let(:csv_1) {CaratSchedule.new("https://s3-us-west-1.amazonaws.com/r3act/uploads/test/schedule.xls")}
  let(:csv_2) {CaratSchedule.new("https://s3-us-west-1.amazonaws.com/r3act/uploads/test/schedule_2.xlsx")}
  let(:csv_3) {CaratSchedule.new("https://s3-us-west-1.amazonaws.com/r3act/uploads/test/schedule_3.xlsx")}

  context "csv_1" do
    xit "should return 'total_cost' as last value" do
      expect(csv_1.header.last).to eq("total_cost")
    end
  end

  context "csv_2" do
    xit "should return 'total_cost' as last value" do
      expect(csv_2.header.last).to eq("total_cost")
    end
  end

  context "csv_3" do
    xit "should return 'total_cost' as last value" do
      expect(csv_3.header.last).to eq("total_cost")
    end
  end

end