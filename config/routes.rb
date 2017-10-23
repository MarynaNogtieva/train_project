Rails.application.routes.draw do
  resources :routes
  resources :trains do
    resources :cars, shallow: true
    resources :econom_car, controller: 'cars', type: 'EconomCar', shallow: true
    resources :sv_car, controller: 'cars', type: 'SvCar', shallow: true
    resources :business_car, controller: 'cars', type: 'BusinessCar', shallow: true
    resources :seated_car, controller: 'cars', type: 'SeatedCar', shallow: true
  end
  resources :railway_stations do
    patch :update_serial_number, on: :member #we can use on: :collectoin
    patch :update_time_arrival, on: :member
    patch :update_time_departure, on: :member
  end
  resources :cars
  resources :econom_car, controller: 'cars', type: 'EconomCar'
  resources :sv_car, controller: 'cars', type: 'SvCar'
  resources :business_car, controller: 'cars', type: 'BusinessCar'
  resources :seated_car, controller: 'cars', type: 'SeatedCar'
  
  get 'welcome/index'
  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
