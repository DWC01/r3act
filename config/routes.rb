Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'campaigns#index'

  namespace :api do    
    resources :campaigns, :flights, :ad_tags
    
    resources :campaigns do
      resources :flights, defaults: { format: :json }
    end
    resources :flights do
      resources :ad_tags, defaults: { format: :json }
    end
  end
  
  resources :campaigns, :flights, :ad_tags
  
  get  '/campaigns/:id/media_plan',    to: 'campaigns#media_plan',      as: 'media_plan'
  get  '/campaigns/:id/analytics',     to: 'campaigns#show'
  get  '/campaigns/:id/trafficking',   to: 'campaigns#trafficking',     as: 'trafficking'
  get  '/campaigns/:id/wrap_up',       to: 'campaigns#wrap_up',         as: 'wrap_up'
  post '/traffic_ad_tags',             to: 'campaigns#traffic_ad_tags', as: 'traffic_ad_tags'
end
