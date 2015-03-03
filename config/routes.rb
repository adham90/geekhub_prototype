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
      get 'work_and_education', to: 'profiles#work_and_education'
      get 'skills', to: 'profiles#skills'
    end
  end
  put 'profile/like/:username' => 'profiles#like', as: "like_profile"
  put 'profile/unlike/:username' => 'profiles#unlike', as: "unlike_profile"


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
  get "/sitemap" => redirect("http://geekhub-io.s3.amazonaws.com/sitemaps/sitemap.xml.gz")
  # autocompletes

  get '/autocompletes/title', to: 'autocompletes#title', as: 'autocompletes_title'
  get '/autocompletes/skill', to: 'autocompletes#skill', as: 'autocompletes_skill'
  get '/autocompletes/university', to: 'autocompletes#university', as: 'autocompletes_university'

  post "/after_signup/confirm_facebook", to: "after_signup#update"
end
