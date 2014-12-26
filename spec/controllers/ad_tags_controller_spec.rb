# require "spec_helper"
 
# describe AdTagController do
#   context "GET #index" do
#     let(:ad_tags) { FactoryGirl.create_list(:ad_tag) }
 
#     before do
#       get :index
#     end
 
#     it "responds successfully with an HTTP 200 status code" do
#       expect(response).to be_success
#       expect(response.code).to eq("200")
#     end
 
#     it "loads all of the resources" do
#       expect(assigns(:ad_tags)).to match_array(resources)
#     end
#   end
 
#   context "POST #create" do
#     let(:resource_params) { FactoryGirl.attributes_for(:resource) }
 
#     before do
#       post :create, resource: resource_params
#     end
 
#     it "should respond successfully with an HTTP 201 status code" do
#       expect(response).to be_success
#       expect(response.code).to eq("201")
#     end
#   end
 
#   context "GET #show" do
#     let!(:resource) { FactoryGirl.create(:resource) }
 
#     before do
#       get :show, id: resource.id
#     end
 
#     it "responds successfully with an HTTP 200 status code" do
#       expect(response).to be_success
#       expect(response.code).to eq("200")
#     end
#   end
 
#   context "PATCH #update" do
#     let!(:resource) { FactoryGirl.create(:resource) }
#     let(:changes) { Faker::Lorem.words }
 
#     before do
#       patch :update, id: resource.id, resource: { example_attribute: changes }
#     end
 
#     it "responds successfully with an HTTP 204 status code" do
#       expect(response).to be_success
#       expect(response.code).to eq("204")
#     end
 
#     it "should have changed the resource's example attribute" do
#       resource.reload
#       expect(resource.example_attribute).to eq(changes)
#     end
#   end
 
#   context "DELETE #destroy" do
#     let!(:resource) { FactoryGirl.create(:resource) }
#     let(:resource_id) { resource.id }
 
#     before do
#       delete :destroy, id: resource.id
#     end
 
#     it "responds successfully with an HTTP 204 status code" do
#       expect(response).to be_success
#       expect(response.code).to eq("204")
#     end
 
#     it "should destroy the resource" do
#       expect { Resource.find(resource_id) }.to raise_error(ActiveRecord::RecordNotFound)
#     end
#   end
# end