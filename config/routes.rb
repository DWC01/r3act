Rails.application.routes.draw do
  root 'campaigns#index'
   namespace :api do
    resources :campaigns, :ad_tags, defaults: { format: :json }
    get 'campaigns/:id/ad_tags', to: 'campaigns#ad_tags'
  end

  resources :campaigns, :ad_tags
end
