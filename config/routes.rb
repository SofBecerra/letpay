Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "events/:event_id/link", to: "events#link", as: :event_link

  resources :events, only: [:new, :create] do
    resources :bills, only: [:create, :new]
  end
  resources :bills, only: [:show, :edit] do
    resources :items, only: [:create, ]
  end

  resources :items, only: [:destroy, :update]

  post "bills/:id/calculate/tips", to: "tips#create", as: :tips

  resources :bills do
    member do
      get :participants
      get :calculate
      get :items
      get :layout
    end
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end
