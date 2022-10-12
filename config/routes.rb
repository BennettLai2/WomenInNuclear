Rails.application.routes.draw do
  get 'users/index'
  devise_for :users do
    post "meeting"
  end
  
  resources :events
  resources :accounts do
    post "meeting"
  end

  root 'sessions#login'
  resources :users
  resources :sessions do
    post "meeting"
  end

  get '/admin', to: 'accounts#admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/signup/:id", to: 'events#signup', as: 'signup'
end
