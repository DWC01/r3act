# require "spec_helper"
 
# describe CampaignsController do
#   context "GET #index" do
#     let(:campaigns) { FactoryGirl.create_list(:campaign, 3) }
 
#     before do
#       get :index
#     end
 
#     xit "responds successfully with an HTTP 200 status code" do
#       expect(response).to be_success
#       expect(response.code).to eq("200")
#     end
 
#     xit "loads all of the campaigns" do
#       expect(assigns(:campaigns)).to match_array(campaigns)
#     end

#     xit "renders the :index template" do
#       get :index
#       expect(response).to render_template :index
#     end
#   end
 
#   context "POST #create" do
#     let(:campaign_params) { FactoryGirl.attributes_for(:campaign) }
 
#     xit "saves the new campaign in the database" do
#       expect { 
#         post :create, campaign: campaign_params
#       }.to change(Campaign, :count).by(1)
#     end
 
#     xit "redirects to campaigns#show" do
#       post :create, campaign: campaign_params
#       expect(response).to redirect_to campaign_path(assigns[:campaign])
#     end
#   end
 
#   context "GET #show" do
#     let!(:campaign) { FactoryGirl.create(:campaign) }
 
#     before do
#       get :show, id: campaign.id
#     end
 
#     xit "responds successfully with an HTTP 200 status code" do
#       expect(response).to be_success
#       expect(response.code).to eq("200")
#     end
#   end
 
  # context "PATCH #update" do
 
  #   let(:campaign) { FactoryGirl.create(:campaign) }
    
  #   before do  
  #     patch :update, id: campaign.id, campaign: { name: 'Test Name' }
  #   end
  
  #   it "locates the requested campaign" do
  #     expect(assigns(:campaign)).to eq(campaign) 
  #   end
      
  #   xit "changes campaign's attributes" do
  #     campaign.reload
  #     expect(Campaign.name).to eq('Test Name')
  #   end
      
  #   xit "redirects to the updated campaign" do
  #     patch :update, id: @contact, contact: attributes_for(:contact) 
  #     expect(response).to redirect_to @contact
  #   end
  # end
 
  # context "DELETE #destroy" do
  #   let!(:campaign) { FactoryGirl.create(:campaign) }
  #   let(:campaign_id) { campaign.id }
 
  #   before do
  #     delete :destroy, id: campaign.id
  #   end
 
  #   xit "responds successfully with an HTTP 204 status code" do
  #     expect(response).to be_success
  #     expect(response.code).to eq("204")
  #   end
 
  #   xit "should destroy the campaign" do
  #     expect { Campaign.find(campaign_id) }.to raise_error(ActiveRecord::RecordNotFound)
  #   end
  # end
# end