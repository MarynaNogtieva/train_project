Rails.application.routes.draw do
  resources :routes
  resources :trains
  resources :railway_stations do
    patch :update_serial_number, on: :member #we can use on: :collectoin
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
