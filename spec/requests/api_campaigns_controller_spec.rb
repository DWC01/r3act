require 'spec_helper'
 
describe Api::CampaignsController do
  
  context 'GET #index' do
    
    before do
      FactoryGirl.create_list(:campaign, 10)
      get 'api/campaigns'
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives all campaigns' do
      json = JSON.parse(response.body)
      campaigns = json["r3act"].map {|m| m['id']}
      expect(campaigns.length).to eq(10)     
    end
  end

  context 'POST #create' do
    
    before do
      post "/api/campaigns/", format: :json, :campaign => { name: "Christmas Campaign" }
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives newly created campaign' do
      campaign = Campaign.all
      expect(campaign.last.name).to eq('Christmas Campaign')
    end
  end

  context 'GET #show' do
    
    before do
      campaign = FactoryGirl.create :campaign, name: 'Christmas Campaign'
      get "/api/campaigns/#{campaign.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific campaign' do
      json = JSON.parse(response.body)
      expect(json['r3act']['name']).to eq('Christmas Campaign')
    end
  end

  context 'PATCH #update' do
    
    before do
      campaign = FactoryGirl.create :campaign, name: 'Christmas Campaign'
      campaign.update(name: 'Christmas C')
      get "/api/campaigns/#{campaign.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end


    it 'retreives a specific campaign' do
      json = JSON.parse(response.body)
      expect(json['r3act']['name']).to eq('Christmas C')
    end
  end

  context 'DELETE #destroy' do

    before do
      campaign = FactoryGirl.create :campaign
      @id = campaign.id
      campaign.delete
    end

    it "should destroy the campaign" do
      expect { Campaign.find(@id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
 