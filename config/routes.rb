Rails.application.routes.draw do
  resources :profiles, except: [:edit, :destroy]
  resources :jobs do
    get :autocomplete_company_name, :on => :collection
  end
  resources :companies, only: [:index]
  get '/@:username', to: 'profiles#show', as: 'show_profile'
  get '/addskill', to: 'profiles#add_skill'
  get '/signup', to: 'profiles#new', as: 'signup'
  get '/profile/edit', to: 'profiles#edit', as: 'profile_edit'
  devise_for :users
  root "profiles#index"
end
