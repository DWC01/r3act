require 'spec_helper'
 
describe Api::UsersController do
  
  context 'GET #index' do
    
    before do
      10.times do |i|
        create(:user, email: "david_#{i}@gmail.com")
      end
      get '/api/users'
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200' || '304')
    end

    it 'retreives all users' do
      json = JSON.parse(response.body)
      users = json["r3act"].map {|m| m['id']}
      expect(users.length).to eq(10)     
    end
  end

  context 'POST #create' do
    
    before do
      @id = FactoryGirl.create(:company).id
      post "/api/users/", format: :json, :user => { company_id: @id, first_name: "Christmas Ad Tag", email: "david_#{@id}@gmail.com", password: "12345", password_confirmation: "12345" }
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives newly created Ad Tag' do
      tag = User.all
      expect(tag.last.first_name).to eq('Christmas Ad Tag')
      expect(tag.last.company_id).to eq(@id)
    end
  end

  context 'GET #show' do
    
    before do
      user = FactoryGirl.create :user, first_name: 'David'
      get "/api/users/#{user.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific user' do
      json = JSON.parse(response.body)
      expect(json['r3act']['first_name']).to eq('David')
    end
  end

  context 'PATCH #update' do
    
    before do
      user = FactoryGirl.create :user, first_name: 'David'
      user.update(first_name: 'DC')
      get "/api/users/#{user.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end


    it 'retreives a specific user' do
      json = JSON.parse(response.body)
      expect(json['r3act']['first_name']).to eq('DC')
    end
  end

  context 'DELETE #destroy' do

    before do
      user = FactoryGirl.create :user
      @id = user.id
      user.delete
    end

    it "should destroy the user" do
      expect { User.find(@id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end