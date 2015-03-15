require "spec_helper"
 
describe FlightComposer do
    
  context "Media Plan 1" do
    let(:media_plan)  {MediaPlanParser.new('/Users/DWC01/Sites/r3act/public/media_plan1.xls')}
    let(:mp_flight)   {FlightComposer.new(media_plan.all_rows)}
    let(:basics)      {mp_flight.flight_basics}
    let(:placements)  {mp_flight.group_placements}
    let(:ad_tag_atts) {mp_flight.ad_tag_attributes}


    context "Properly initializes" do
      
      it '#flight_basics' do
        expect(basics.length).to eq(8)

        expect(basics.first['name']).to eq('Catalogue Extension')
        expect(basics.first['adserver_cost']).to eq('5165.79')

        expect(basics.last['name']).to eq('Retargeting')
        expect(basics.last['adserver_cost']).to eq('0.0')
      end

      it "#group_placements" do
        expect(placements.length).to eq(8)

        expect(placements['Catalogue Extension__12'].length).to eq(6)
        expect(placements['Catalogue Extension__12'].second.first).to eq('iNC')
        expect(placements['Catalogue Extension__12'].last.last.to_s).to eq('5939.655')

        expect(placements['Retargeting__90'].length).to eq(9)
        expect(placements['Retargeting__90'].last.first).to eq('Big Mobile')
        expect(placements['Retargeting__90'].last.last.to_s).to eq('20000.0')
      end

      it "#ad_tag_attributes" do
        expect(ad_tag_atts.length).to eq(8)

        expect(ad_tag_atts.first.length).to eq(5)
        expect(ad_tag_atts.first.first['publisher']).to eq('iNC')
        expect(ad_tag_atts.first.last['total_cost']).to eq('5939.655')

        expect(ad_tag_atts.last.length).to eq(8)
        expect(ad_tag_atts.last.first['publisher']).to eq('AMNET')
        expect(ad_tag_atts.last.last['total_cost']).to eq('20000.0')
      end

    end
  end
end