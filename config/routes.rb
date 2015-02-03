Rails.application.routes.draw do
  devise_for :company_accounts
  resources :profiles, except: [:edit, :destroy] do
    get :autocomplete_university_name, :on => :collection

  end
  resources :jobs do
    get :autocomplete_company_name, :on => :collection
  end

  resources :skills do
    get :autocomplete_skill_name, :on => :collection
  end

  resources :profile_locations
  resources :companies, only: [:index]
  get 'profiles/locations/:id', to: 'profiles#locations'
  get '/@:username', to: 'profiles#show', as: 'show_profile'
  get '/@:username/about', to: 'profiles#about', as: 'profile_about'
  get '/addskill', to: 'profiles#add_skill'
  get '/signup', to: 'profiles#new', as: 'signup'
  get '/profile/edit', to: 'profiles#edit', as: 'profile_edit'
  devise_for :users
  root "search#index"

  # search
  get '/search', to: 'search#index'

  # autocompletes
  get '/autocompletes/skill', to: 'autocompletes#skill', as: 'autocompletes_skill'

end
