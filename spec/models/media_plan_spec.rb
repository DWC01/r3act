require "spec_helper"
 
describe MediaPlan do
    
  context "Media Plan 1" do
    let(:media_plan1) {MediaPlan.new('/Users/DWC01/Sites/r3act/public/media_plan1.xls')}

    context "Properly initializes" do
      let(:basics) {media_plan1.campaign_basics}
      let(:flights) {media_plan1.set_flights}

      it "#set_all_rows" do
        expect(media_plan1.all_rows.last.first).to eq('Big Mobile')
        expect(media_plan1.all_rows.last.last).to eq('LAST CELL')
      end

      it "#set_campaign_basics" do
        expect(basics['campaign_name'] ).to eq('Best Campaign Ever "CTR Through The Roof"')
        expect(basics['start_date'].to_s).to eq('2015-01-01')
        expect(basics['end_date'].to_s).to eq('2016-01-01')
        expect(basics['advertiser']).to eq('CocaCola Zero')
        expect(basics['primary_target_audience']).to eq('Males 20-30')
        expect(basics['media_plan_name']).to eq('Best Campaign Ever "CTR Through The Roof"')
      end

      it "#set_flights" do
        expect(flights.length).to eq(8)

        expect(flights['Catalogue Extension__12'].length).to eq(6)
        expect(flights['Catalogue Extension__12'].second.first).to eq('iNC')
        expect(flights['Catalogue Extension__12'].last.last.to_s).to eq('5939.655')

        expect(flights['Retargeting__90'].length).to eq(9)
        expect(flights['Retargeting__90'].last.first).to eq('Big Mobile')
        expect(flights['Retargeting__90'].last.last.to_s).to eq('20000.0')
      end

      it "#set_ad_tag_atts" do
      end


    end
  end
end