require 'spec_helper'
 
describe Api::CompaniesController do
  
  context 'GET #index' do
    
    before do
      FactoryGirl.create_list(:company, 10)
      get 'api/companies'
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200' || '304')
    end

    it 'retreives all companies' do
      json = JSON.parse(response.body)
      companies = json["r3act"].map {|m| m['id']}
      expect(companies.length).to eq(10)     
    end
  end

  context 'POST #create' do
    
    before do
      post "/api/companies/", format: :json, :company => { name: "Best Campaign Eva" }
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives newly created Company' do
      company = Company.all
      expect(company.last.name).to eq('Best Campaign Eva')
    end
  end

  context 'GET #show' do
    
    before do
      company = FactoryGirl.create :company, name: 'Best Campaign Eva'
      get "/api/companies/#{company.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific company' do
      json = JSON.parse(response.body)
      expect(json['r3act']['name']).to eq('Best Campaign Eva')
    end
  end

  context 'PATCH #update' do
    
    before do
      company = FactoryGirl.create :company, name: 'Best Campaign Eva'
      company.update(name: 'Christmas C')
      get "/api/companies/#{company.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end


    it 'retreives a specific company' do
      json = JSON.parse(response.body)
      expect(json['r3act']['name']).to eq('Christmas C')
    end
  end

  context 'DELETE #destroy' do

    before do
      company = FactoryGirl.create :company
      @id = company.id
      company.delete
    end

    it "should destroy the company" do
      expect { Company.find(@id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
 