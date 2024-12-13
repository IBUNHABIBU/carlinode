Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  resources :sessions, only: [:create]
  resources :users, only: [:create]
  
  namespace :api do
    namespace :v1 do   
      get "cars/recent", to: "cars#index", scope: "recent"
      resources :cars
      resources :bookings
      resources :projects
      resources :skills
    end
  end
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
end
