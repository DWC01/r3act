require 'spec_helper'
 
describe Api::AdTagsController do
  
  context 'GET #index' do
    
    before do
      FactoryGirl.create_list(:ad_tag, 10)
      get 'api/ad_tags'
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives all ad_tags' do
      json = JSON.parse(response.body)
      ad_tags = json["r3act"].map {|m| m['id']}
      expect(ad_tags.length).to eq(10)     
    end
  end

  context 'POST #create' do
    
    before do
      post "/api/ad_tags/", format: :json, :ad_tag => { placement_name: "Christmas Ad Tag" }
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives newly created Ad Tag' do
      tag = AdTag.all
      expect(tag.last.placement_name).to eq('Christmas Ad Tag')
    end
  end

  context 'GET #show' do
    
    before do
      ad_tag = FactoryGirl.create :ad_tag, placement_name: 'Christmas Ad Tag'
      get "/api/ad_tags/#{ad_tag.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific ad_tag' do
      json = JSON.parse(response.body)
      expect(json['r3act']['placement_name']).to eq('Christmas Ad Tag')
    end
  end

  context 'PATCH #update' do
    
    before do
      ad_tag = FactoryGirl.create :ad_tag, placement_name: 'Christmas Ad Tag'
      ad_tag.update(placement_name: 'Christmas C')
      get "/api/ad_tags/#{ad_tag.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end


    it 'retreives a specific ad_tag' do
      json = JSON.parse(response.body)
      expect(json['r3act']['placement_name']).to eq('Christmas C')
    end
  end

  context 'DELETE #destroy' do

    before do
      ad_tag = FactoryGirl.create :ad_tag
      @id = ad_tag.id
      ad_tag.delete
    end

    it "should destroy the ad_tag" do
      expect { AdTag.find(@id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
 