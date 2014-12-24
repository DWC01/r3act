Rails.application.routes.draw do
  root 'dashboards#index'
   namespace :api do
    resources :dashboards, defaults: { format: :json }
  end
end
