require "spec_helper"
 
describe FlightComposer do
    
  context "Media Plan 1" do
    let(:media_plan)    {MediaPlanParser.new('/Users/DWC01/Sites/r3act/public/media_plan1.xls')}
    let(:flight)        {FlightComposer.new(media_plan.all_rows)}
    let(:attributes)    {flight.attributes}


    context "Properly initializes" do
      
      it '#attributes' do
        expect(attributes.length).to eq(8)

        expect(attributes.first['name']).to eq('Catalogue Extension')
        expect(attributes.first['adserver_cost']).to eq('5165.79')

        expect(attributes.last['name']).to eq('Retargeting')
        expect(attributes.last['adserver_cost']).to eq('0.0')
      end

    end
  end
end