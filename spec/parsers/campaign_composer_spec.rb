require "spec_helper"
 
describe CampaignComposer do
    
  context "Media Plan 1" do
    let(:media_plan)  {MediaPlanParser.new('/Users/DWC01/Sites/r3act/public/media_plan1.xls')}
    let(:mp_campaign) {CampaignComposer.new(media_plan.all_rows)}
    let(:basics)      {mp_campaign.campaign_basics}

    context "Properly initializes" do
      it "#set_campaign_basics" do
        expect(basics['campaign_name'] ).to eq('Best Campaign Ever "CTR Through The Roof"')
        expect(basics['start_date'].to_s).to eq('2015-01-01')
        expect(basics['end_date'].to_s).to eq('2016-01-01')
        expect(basics['advertiser']).to eq('CocaCola Zero')
        expect(basics['primary_target_audience']).to eq('Males 20-30')
        expect(basics['media_plan_name']).to eq('Best Campaign Ever "CTR Through The Roof"')
      end
    end

  end

end