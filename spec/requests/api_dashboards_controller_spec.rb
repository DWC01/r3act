require 'spec_helper'
 
describe Api::DashboardsController do
  
  context 'GET #index' do
    
    before do
      FactoryGirl.create_list(:dashboard, 10)
      get 'api/dashboards'
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives all dashboards' do
      json = JSON.parse(response.body)
      dashboards = json["dashboards"].map {|m| m['id']}
      expect(dashboards.length).to eq(10)     
    end
  end

  context 'POST #create' do
    
    before do
      post "/api/dashboards/", format: :json, :dashboard => { title: 'Test Dash', category: 'Pie Chart', size: "Large" }
    end

    it 'responds successfully with an HTTP 201 status code' do
      expect(response).to be_success
      expect(response.code).to eq('201')
    end

    it 'retreives newly created dashboard' do
      dash = Dashboard.all
      expect(dash.last.title).to eq('Test Dash')
    end
  end

  context 'GET #show' do
    
    before do
      dashboard = FactoryGirl.create :dashboard, title: 'Testy Dash'
      get "/api/dashboards/#{dashboard.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific dashboard' do
      json = JSON.parse(response.body)
      expect(json["dashboard"]['title']).to eq('Testy Dash')
    end
  end

  context 'PATCH #update' do
    
    before do
      dashboard = FactoryGirl.create :dashboard, title: 'Testy Dash'
      dashboard.update(title: 'Testy D')
      get "/api/dashboards/#{dashboard.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end


    it 'retreives a specific dashboard' do
      json = JSON.parse(response.body)
      expect(json["dashboard"]['title']).to eq('Testy D')
    end
  end

  context 'DELETE #destroy' do

    before do
      dashboard = FactoryGirl.create :dashboard
      @id = dashboard.id
      dashboard.delete
    end

    it "should destroy the dashboard" do
      expect { Dashboard.find(@id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
 