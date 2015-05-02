Rails.application.routes.draw do

  # resources :campaigns

  namespace :api do    
    resources :sessions, :only => [:create, :show]
    resources :campaigns, :flights, :ad_tags, :users, 
              :companies, :avatars

    resources :campaigns do
      resources :flights
    end
    
  end

  get  "/api/sign",                      to: "api/sign#sign"
  get  "/api/current_user",              to: "api/users#current_user"
  post "/api/password_resets",           to: "api/password_resets#create"
  post "/api/password_resets/update",    to: "api/password_resets#update"

  root "ember#bootstrap"
  get "/*path", to: "ember#bootstrap"
end
