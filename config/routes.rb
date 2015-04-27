Rails.application.routes.draw do

  # resources :campaigns

  namespace :api do    
    resources :campaigns, :flights, :ad_tags, :users, :companies
    resources :sessions, :only => [:create, :show]

    resources :campaigns do
      resources :flights
    end
    
  end

  get  "/api/sign_campaign_media_plan",  to: "api/sign#sign_campaign_media_plan"
  get  "/api/current_user",              to: "api/users#current_user"
  post "/api/password_resets",           to: "api/password_resets#create"
  post "/api/password_resets/update",    to: "api/password_resets#update"

  root "ember#bootstrap"
  get "/*path", to: "ember#bootstrap"
end
