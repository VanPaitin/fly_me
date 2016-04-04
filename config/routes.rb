Rails.application.routes.draw do

  get 'sessions/destroy'

  root "flights#index"
  resources :flights,  only:  :index do
    resources :bookings
  end
  post "bookings" => "bookings#new_placeholder"
  get "auth/:provider/callback" => "sessions#create"
end
