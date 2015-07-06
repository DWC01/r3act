Rails.application.routes.draw do

  namespace :api do
    resources :sessions, :only => [:create, :show]
    resources :campaigns, :flights, :ad_tags, :users, 
              :companies, :avatars, :creatives, :backup_creatives

    resources :campaigns do
      resources :flights
    end
  end

  get  "/tags/:id",                      to: "tags#show"
  get  "/api/sign",                      to: "api/sign#sign"
  post "/api/password_resets",           to: "api/password_resets#create"
  post "/api/password_resets/update",    to: "api/password_resets#update"
  post "/api/traffic_campaign",          to: "api/campaigns#traffic_campaign"

  root "ember#bootstrap"
  get "/*path", to: "ember#bootstrap"
end
