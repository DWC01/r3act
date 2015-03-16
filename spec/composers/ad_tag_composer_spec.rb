require "spec_helper"
 
describe AdTagComposer do
    
  context "Media Plan" do
    let(:media_plan)    {MediaPlanParser.new('/Users/DWC01/Sites/r3act/public/media_plan1.xls')}
    let(:ad_tag)        {AdTagComposer.new(media_plan.all_rows)}
    let(:placements)    {ad_tag.group_placements}
    let(:attributes)    {ad_tag.attributes}

    context "Properly initializes" do

      it "#group_placements" do
        expect(placements.length).to eq(8)

        expect(placements['Catalogue Extension__12'].length).to eq(6)
        expect(placements['Catalogue Extension__12'].second.first).to eq('iNC')
        expect(placements['Catalogue Extension__12'].last.last.to_s).to eq('5939.655')

        expect(placements['Retargeting__90'].length).to eq(9)
        expect(placements['Retargeting__90'].last.first).to eq('Big Mobile')
        expect(placements['Retargeting__90'].last.last.to_s).to eq('20000.0')
      end

      it "#attributes" do
        expect(attributes.length).to eq(8)

        expect(attributes.first.length).to eq(5)
        expect(attributes.first.first['publisher']).to eq('iNC')
        expect(attributes.first.last['total_cost']).to eq('5939.655')

        expect(attributes.last.length).to eq(8)
        expect(attributes.last.first['publisher']).to eq('AMNET')
        expect(attributes.last.last['total_cost']).to eq('20000.0')
      end

    end
  end
end