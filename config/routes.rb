Rails.application.routes.draw do
  devise_for :users
  
  resource :search, only: [:show, :new]
  resources :routes
  resources :tickets
  
  namespace :admin do
    resources :railway_stations do
      patch :update_serial_number, on: :member #we can use on: :collectoin
      patch :update_time_arrival, on: :member
      patch :update_time_departure, on: :member
    end
    
    resources :trains do
      resources :cars
    end
  
    resources :routes
    resources :tickets
    root 'welcome#index'
  end

  root  "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
