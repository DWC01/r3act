Rails.application.routes.draw do
  root 'campaigns#index'
   namespace :api do
    resources :campaigns, defaults: { format: :json } do
      resources :ad_tags, defaults: { format: :json }
    end
    resources :ad_tags, defaults: { format: :json }
  end

  resources :campaigns, :ad_tags
end
