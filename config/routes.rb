Rails.application.routes.draw do
  root 'application#index'
  
  root 'application#index'
  get '*path' => 'application#index'
  
end
