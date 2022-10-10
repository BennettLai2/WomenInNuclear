Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :accounts do
    get "meeting"
  end

  root 'sessions#login'

  get '/admin', to: 'accounts#admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/signup/:id", to: 'events#signup', as: 'signup'
end
