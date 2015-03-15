require "spec_helper"
 
describe MediaPlanParser do

  context "Media Plan" do
    let(:media_plan1) {MediaPlanParser.new('/Users/DWC01/Sites/r3act/public/media_plan1.xls')}
    let(:basics) {media_plan1.campaign_basics}
  
    context "Properly initializes" do
      it "#set_all_rows" do
        expect(media_plan1.all_rows.last.first).to eq('Big Mobile')
        expect(media_plan1.all_rows.last.last).to eq('LAST CELL')
      end
    end
  end
end