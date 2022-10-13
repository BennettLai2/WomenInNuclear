Rails.application.routes.draw do
  resources :person_milestone_maps
  resources :milestones
  get 'users/index'
  devise_for :users

  resources :events

  # Deprecated code, will delete later
  # resources :accounts do
  #   post "meeting"
  #   get "resetpoints"
  #   post "resetpointsconfirm"
  # end

  root 'sessions#login'

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
  get "/:id/mymilestones", to: 'person_milestone_maps#my_milestones', as: 'mymilestones'
end
