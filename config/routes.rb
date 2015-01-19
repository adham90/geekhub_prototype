Rails.application.routes.draw do
  resources :profiles

  devise_for :users
  resources :users
  
end
