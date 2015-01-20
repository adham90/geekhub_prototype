Rails.application.routes.draw do
  resources :profiles
  get '/signup', to: 'profiles#new', as: 'signup'
  get '/profile/edit', to: 'profiles#edit', as: 'profile_edit'
  devise_for :users
  resources :users
  root "profiles#index"
end
