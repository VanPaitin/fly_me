Rails.application.routes.draw do
  delete '/logout' => "sessions#destroy"
  root "flights#index"
  resources :bookings, only: :edit
  resources :flights,  only:  :index do
    resources :bookings
  end
  get 'user/bookings' => "bookings#index"
  post "bookings" => "bookings#new_placeholder"
  get "/auth/:provider/callback" => "sessions#create"
end
