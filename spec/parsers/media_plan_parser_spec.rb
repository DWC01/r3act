require "spec_helper"
 
describe MediaPlanParser do

  context "Media Plan" do
    let(:media_plan) {MediaPlanParser.new('/Users/DWC01/Sites/r3act/public/media_plan1.xls')}
    let(:flight_ad_tags_atts) {media_plan.flight_ad_tags_atts}
  
    context "Properly initializes" do
      it "#set_all_rows" do
        expect(media_plan.all_rows.last.first).to eq('Big Mobile')
        expect(media_plan.all_rows.last.last).to eq('LAST CELL')
      end
      it "#data_check_passed?" do
        expect(media_plan.data_check_passed?).to eq(true)
      end
      it "#flight_ad_tags_atts" do
        expect(flight_ad_tags_atts.length).to eq(8)
        expect(flight_ad_tags_atts.kind_of? Array).to eq(true)

        expect(flight_ad_tags_atts.first.first.kind_of? Hash).to eq(true)
        expect(flight_ad_tags_atts.first.first['name']).to eq('Catalogue Extension')

        expect(flight_ad_tags_atts.first.second.length).to eq(5)
        expect(flight_ad_tags_atts.first.second.kind_of? Array).to eq(true)
        expect(flight_ad_tags_atts.first.second.first['publisher']).to eq('iNC')


        expect(flight_ad_tags_atts.last.first.kind_of? Hash).to eq(true)
        expect(flight_ad_tags_atts.last.first['name']).to eq('Retargeting')

        expect(flight_ad_tags_atts.last.second.length).to eq(8)
        expect(flight_ad_tags_atts.last.second.kind_of? Array).to eq(true)
        expect(flight_ad_tags_atts.last.second.last['total_cost']).to eq('20000.0')
      end
    end
  end
end