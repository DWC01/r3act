require 'spec_helper'
 
describe Api::FlightsController do
  
  context 'GET api/campaigns/:campaign_id/flights#index' do
    
    before do
      @id = FactoryGirl.create(:campaign).id

      5.times do 
        FactoryGirl.create :flight, campaign_id: @id
        FactoryGirl.create :flight, campaign_id: (@id+1)
      end

      get "/api/campaigns/#{@id}/flights"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives only this campaign\'s flights' do
      json = JSON.parse(response.body)
      flights = json["r3act"].map {|m| m['id']}
      expect(flights.length).to eq(5)     
    end
  end

  context 'POST api/campaigns/:id/flights#create' do
    
    before do
      @id = FactoryGirl.create(:campaign).id
      post "/api/campaigns/#{@id}/flights/", format: :json, :flight => { campaign_id: @id, adserver_cost: "3000", name: "Retargeting" }
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives newly created Flight' do
      flight = Flight.all
      expect(flight.last.name).to eq('Retargeting')
      expect(flight.last.campaign_id).to eq(@id)
    end
  end

  context 'GET api/campaigns/:campaign_id/flights/:id#show' do
    
    before do
      camp_id = FactoryGirl.create(:campaign).id
      flight_id = FactoryGirl.create(:flight, name: 'Retargeting').id
      get "/api/campaigns/#{camp_id}/flights/#{flight_id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific flight' do
      json = JSON.parse(response.body)
      expect(json['r3act']['name']).to eq('Retargeting')
    end
  end

  context 'PATCH api/campaigns/:campaign_id/flights/:id#update' do
    
    before do
      campaign = FactoryGirl.create(:campaign)
      flight = FactoryGirl.create :flight, name: 'Retargeting'
      flight.update(name: 'Progressive')
      get "/api/campaigns/#{campaign.id}/flights/#{flight.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific flight' do
      json = JSON.parse(response.body)
      expect(json['r3act']['name']).to eq('Progressive')
    end
  end

end