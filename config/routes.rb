Rails.application.routes.draw do

  resources :profiles, except: [:edit, :destroy] do
    get :autocomplete_university_name, :on => :collection
    collection do
      post 'create_pair'
      get '/locations/:id', to: 'profiles#locations'
      get '/edit', to: 'profiles#edit'
    end
  end

  resources :jobs do
    get :autocomplete_company_name, :on => :collection
  end

  resources :skills do
    get :autocomplete_skill_name, :on => :collection
  end

  get '/@:username', to: 'profiles#show', as: 'show_profile'
  get '/@:username/about', to: 'profiles#about', as: 'profile_about'
  get '/addskill', to: 'profiles#add_skill'
  get '/signup', to: 'profiles#new', as: 'signup'
  devise_for :users
  root "search#index"

  # search
  get '/search', to: 'search#index'

  # autocompletes
  get '/autocompletes/skill', to: 'autocompletes#skill', as: 'autocompletes_skill'
  get '/autocompletes/university', to: 'autocompletes#university', as: 'autocompletes_university'

end
