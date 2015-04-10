Rails.application.routes.draw do

  resources :campaigns, :only => [:new, :create]

  namespace :api do    
    resources :campaigns, :flights, :ad_tags, :users, :companies
    
    resources :campaigns do
      resources :flights, defaults: { format: :json }
    end
    resources :flights do
      resources :ad_tags, defaults: { format: :json }
    end
  end

  
  root "ember#bootstrap"
  get "/*path", to: "ember#bootstrap"
end
