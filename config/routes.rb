Rails.application.routes.draw do


  resources :campaigns, :only => [:new, :create]

  namespace :api do    

    resources :campaigns, :flights, :ad_tags, :users, :companies
    resources :sessions, :only => [:create, :show]
    

    resources :campaigns do
      resources :flights, defaults: { format: :json }
    end
    resources :flights do
      resources :ad_tags, defaults: { format: :json }
    end
  end

  get  "/api/current_user",              to: "api/users#current_user"
  post "/api/password_resets",           to: "api/password_resets#create"
  post "/api/password_resets/update",    to: "api/password_resets#update"



  root "ember#bootstrap"
  get "/*path", to: "ember#bootstrap"
end
