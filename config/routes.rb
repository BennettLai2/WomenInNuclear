Rails.application.routes.draw do
  resources :meetinglogs
  resources :person_milestone_maps
  resources :milestones
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

  resources :sessions do
    post "meeting"
    get "resetpoints"
    post "resetpointsconfirm"
  end

  devise_scope :user do 
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  resources :users


  get '/admin', to: 'accounts#admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/signup/:id", to: 'events#signup', as: 'signup'
  get '/leaderboard', to: 'sessions#leaderboard'
  get "/:id/mymilestones", to: 'person_milestone_maps#my_milestones', as: 'mymilestones'
end
