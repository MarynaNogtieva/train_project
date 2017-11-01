Rails.application.routes.draw do
  
  resources :routes

  resources :railway_stations do
    patch :update_serial_number, on: :member #we can use on: :collectoin
    patch :update_time_arrival, on: :member
    patch :update_time_departure, on: :member
  end
  
  resources :cars
  # resources :econom_car, controller: 'cars', type: 'EconomCar' -
  
  resources :trains do
    resources :cars, shallow: true
  end
  
  resource :search, only: [:show, :new]
  resources :tickets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
