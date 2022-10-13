Rails.application.routes.draw do
  get 'users/index'
  devise_for :users do
    post "meeting"
  end
  devise_scope :user do 
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end  
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'users/:id' => 'users#make_admin', :via => :put, :as => :make_admin

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
