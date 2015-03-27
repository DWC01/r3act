require 'spec_helper'
 
describe Api::AdTagsController do
  
  context 'GET api/flights/:flight_id/ad_tags#index' do
    
    before do
      @id = FactoryGirl.create(:flight).id

      5.times do 
        FactoryGirl.create :ad_tag, flight_id: @id
        FactoryGirl.create :ad_tag, flight_id: (@id+1)
      end

      get "/api/flights/#{@id}/ad_tags"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives only this flight\'s ad_tags' do
      json = JSON.parse(response.body)
      ad_tags = json["r3act"].map {|m| m['id']}
      expect(ad_tags.length).to eq(5)     
    end
  end

  context 'POST api/flights/:id/ad_tags#create' do
    
    before do
      @id = FactoryGirl.create(:flight).id
      post "/api/flights/#{@id}/ad_tags/", format: :json, :ad_tag => { flight_id: @id, cost_method: "Heeeeeeeeeey", placement: "Christmas Ad Tagsss" }
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives newly created Ad Tag' do
      tag = AdTag.all
      expect(tag.last.placement).to eq('Christmas Ad Tagsss')
      expect(tag.last.flight_id).to eq(@id)
    end
  end

  context 'GET api/flights/:flight_id/ad_tags/:id#show' do
    
    before do
      camp_id = FactoryGirl.create(:flight).id
      tag_id = FactoryGirl.create(:ad_tag, placement: 'Christmas Ad Tag').id
      get "/api/flights/#{camp_id}/ad_tags/#{tag_id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific ad_tag' do
      json = JSON.parse(response.body)
      expect(json['r3act']['placement']).to eq('Christmas Ad Tag')
    end
  end

  context 'PATCH api/flights/:flight_id/ad_tags/:id#update' do
    
    before do
      flight = FactoryGirl.create(:flight)
      ad_tag = FactoryGirl.create :ad_tag, placement: 'Christmas Ad Tag'
      ad_tag.update(placement: 'Christmas C')
      get "/api/flights/#{flight.id}/ad_tags/#{ad_tag.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific ad_tag' do
      json = JSON.parse(response.body)
      expect(json['r3act']['placement']).to eq('Christmas C')
    end
  end

end