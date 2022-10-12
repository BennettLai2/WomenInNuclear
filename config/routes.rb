Rails.application.routes.draw do
  resources :person_milestone_maps
  resources :milestones
  resources :events
  resources :accounts do
    get "meeting"
  end

  root 'sessions#login'

  get '/admin', to: 'accounts#admin'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/signup/:id", to: 'events#signup', as: 'signup'
  get "/:id/mymilestones", to: 'person_milestone_maps#my_milestones', as: 'mymilestones'
end
