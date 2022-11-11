Rails.application.routes.draw do
  root 'sessions#new'

  resources :person_milestone_maps
  resources :milestones
  resources :events
  resources :sessions do
    post "meeting"
    get "resetpoints"
    post "resetpointsconfirm"
  end
  
  devise_for :users do
    post "meeting"
  end
  devise_scope :user do 
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end  
  resources :users


  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'users/:id' => 'users#toggle_admin', :via => :put, :as => :toggle_admin
  get "/signup/:id", to: 'events#signup', as: 'signup'
  get '/leaderboard', to: 'sessions#leaderboard'
  get "/:id/mymilestones", to: 'person_milestone_maps#my_milestones', as: 'mymilestones'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
