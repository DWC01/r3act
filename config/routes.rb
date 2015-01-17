Rails.application.routes.draw do
  root 'campaigns#index'
    namespace :api do
      resources :campaigns, :ad_tags
      
      resources :campaigns do
        resources :ad_tags, defaults: { format: :json }
      end
    end
  resources :campaigns, :ad_tags

  get  '/campaigns/:id/media_plan',    to: 'campaigns#media_plan',      as: 'media_plan'
  get  '/campaigns/:id/analytics',     to: 'campaigns#show'
  get  '/campaigns/:id/trafficking',   to: 'campaigns#trafficking',     as: 'trafficking'
  get  '/campaigns/:id/wrap_up',       to: 'campaigns#wrap_up',         as: 'wrap_up'
  post '/traffic_ad_tags',             to: 'campaigns#traffic_ad_tags', as: 'traffic_ad_tags'
end
