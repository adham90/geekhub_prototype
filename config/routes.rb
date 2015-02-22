Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: "users/registrations" }

  resources :after_signup

  resources :profiles, except: [:edit, :destroy] do
    get :autocomplete_university_name, :on => :collection
    collection do
      get '/locations/:id', to: 'profiles#locations'
      get '/edit', to: 'profiles#edit'
      get 'address', to: 'profiles#edit_address'
      get 'linked_accounts', to: 'profiles#linked_accounts'

      get 'skills', to: 'profiles#skills'
      # post 'skills', to: 'profiles#add_skill'
      #
      # post 'add_skills', to: 'profiles#add_skill'
      # post 'edit_skills', to: 'profiles#edit_skills'

    end
  end

  ## pair
  # resources :pairs do
  #   get 'set_status'
  #   get 'navigator_edit'
  # end


  resources :jobs do
    get :autocomplete_company_name, :on => :collection
  end

  resources :skills do
    get :autocomplete_skill_name, :on => :collection
  end

  get '/pairwith/:navigator_id', to: 'pairs#create', as: "pair_with"
  get '/@:username', to: 'profiles#show', as: 'show_profile'
  get '/@:username/about', to: 'profiles#about', as: 'profile_about'
  get '/addskill', to: 'profiles#add_skill'
  get '/signup', to: 'profiles#new', as: 'signup'
  root "search#index"
  # root "landing_page#index"

  # search
  get '/search', to: 'search#index', as: 'search'

  # autocompletes
  get '/autocompletes/skill', to: 'autocompletes#skill', as: 'autocompletes_skill'
  get '/autocompletes/university', to: 'autocompletes#university', as: 'autocompletes_university'

end
