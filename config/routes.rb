Rails.application.routes.draw do

  root 'ember#bootstrap'
  get '/*path' => 'ember#bootstrap'
  
  # root 'campaigns#index'

  # namespace :api do    
  #   resources :campaigns, :flights, :ad_tags, :users, :companies
    
  #   resources :campaigns do
  #     resources :flights, defaults: { format: :json }
  #   end
  #   resources :flights do
  #     resources :ad_tags, defaults: { format: :json }
  #   end
  # end
  
  # resources :campaigns, :flights, :ad_tags, :users, :companies, :password_resets

  # get  '/sign_in',                     to:'sessions#new',              as: 'sign_in'
  # get  '/sign_up',                     to:'users#new',                 as: 'sign_up'
  # get  '/sign_out',                    to:'sessions#destroy',          as: 'sign_out'         
  # post '/sign_in',                     to:'sessions#create'            
  
  # get  '/campaigns/:id/media_plan',    to: 'campaigns#media_plan',      as: 'media_plan'
  # get  '/campaigns/:id/analytics',     to: 'campaigns#show'
  # get  '/campaigns/:id/trafficking',   to: 'campaigns#trafficking',     as: 'trafficking'
  # get  '/campaigns/:id/wrap_up',       to: 'campaigns#wrap_up',         as: 'wrap_up'
  # post '/traffic_ad_tags',             to: 'campaigns#traffic_ad_tags', as: 'traffic_ad_tags'
end
