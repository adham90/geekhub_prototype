Rails.application.routes.draw do
  resources :profiles

  devise_for :users, controllers: {
        sessions: 'sessions'
      }
end
