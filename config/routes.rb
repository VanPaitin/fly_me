Rails.application.routes.draw do
  root "flights#index"
  resources :flights,  only:  :index do
    resources :bookings
  end
  post "bookings" => "bookings#new_placeholder"
end
