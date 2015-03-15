require 'spec_helper'
 
describe Api::FlightsController do
  
  context 'GET #index' do
    
    before do
      FactoryGirl.create_list(:flight, 10)
      get 'api/flights'
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives all flights' do
      json = JSON.parse(response.body)
      flights = json["r3act"].map {|m| m['id']}
      expect(flights.length).to eq(10)     
    end
  end

  context 'POST #create' do
    
    before do
      @id = FactoryGirl.create(:flight).id
      post "/api/flights/", format: :json, :flight => { campaign_id: @id, name: "Retargeting" }
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

  context 'GET #show' do
    
    before do
      flight = FactoryGirl.create :flight, name: 'Retargeting'
      get "/api/flights/#{flight.id}"
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

  context 'PATCH #update' do
    
    before do
      flight = FactoryGirl.create :flight, name: 'Retargeting'
      flight.update(name: 'Christmas C')
      get "/api/flights/#{flight.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end


    it 'retreives a specific flight' do
      json = JSON.parse(response.body)
      expect(json['r3act']['name']).to eq('Christmas C')
    end
  end

  context 'DELETE #destroy' do

    before do
      flight = FactoryGirl.create :flight
      @id = flight.id
      flight.delete
    end

    it "should destroy the flight" do
      expect { Flight.find(@id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
 