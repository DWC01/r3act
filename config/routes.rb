Rails.application.routes.draw do
  root 'campaigns#new'
   namespace :api do
    resources :campaigns, :ad_tags, defaults: { format: :json }
  end

  resources :campaigns, :ad_tags
end
