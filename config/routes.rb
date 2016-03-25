Rails.application.routes.draw do
  get 'bookings/new'

  get 'bookings/show'

  get 'bookings/create'

  root "flights#index"
  resources :flights,  only:  :index
  resources :bookings
  resources :airports
end
