Rails.application.routes.draw do
  delete '/logout' => "sessions#destroy"
  root "flights#index"
  resources :bookings, only: [:new, :edit, :index]
  resources :flights,  only:  :index do
    resources :bookings
  end
  get 'user/bookings' => "bookings#index"
  get "/auth/:provider/callback" => "sessions#create"
  get "reservation" => "bookings#reservation_form"
  post "reservations" => "bookings#make_reservation"
end
