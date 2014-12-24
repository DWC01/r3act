Rails.application.routes.draw do
  root 'campaigns#index'
   namespace :api do
    resources :campaigns, :ad_tags, defaults: { format: :json }
  end
end
