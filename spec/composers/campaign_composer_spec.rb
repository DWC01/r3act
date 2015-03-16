require "spec_helper"
 
describe CampaignComposer do
    
  context "Media Plan 1" do
    let(:media_plan)  {MediaPlanParser.new('/Users/DWC01/Sites/r3act/public/media_plan1.xls')}
    let(:campaign)    {CampaignComposer.new(media_plan.all_rows)}
    let(:attributes)  {campaign.attributes}

    context "Properly initializes" do
      it "#set_attributes" do
        expect(attributes['name'] ).to eq('Best Campaign Ever "CTR Through The Roof"')
        expect(attributes['start_date'].to_s).to eq('2015-01-01')
        expect(attributes['end_date'].to_s).to eq('2016-01-01')
        expect(attributes['advertiser']).to eq('CocaCola Zero')
        expect(attributes['primary_target_audience']).to eq('Males 20-30')
        expect(attributes['media_plan_name']).to eq('Best Campaign Ever "CTR Through The Roof"')
      end
    end

  end

end