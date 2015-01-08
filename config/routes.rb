Rails.application.routes.draw do
  root 'campaigns#index'
    namespace :api do
      resources :campaigns, :ad_tags, defaults: { format: :json }
      resources :campaigns do
        resources :ad_tags, defaults: { format: :json }
      end
    end
  resources :campaigns, :ad_tags

  get '/campaigns/:id/Performance',    to: 'dashboards#performance', as: 'perfomance'
  get '/campaigns/:id/Pacing',         to: 'dashboards#pacing', as: 'pacing'
  get '/campaigns/:id/Discrepancies',  to: 'dashboards#discrepancies', as: 'discrepancies'
end
