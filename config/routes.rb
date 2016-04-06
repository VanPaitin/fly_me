Rails.application.routes.draw do
  delete '/logout' => "sessions#destroy"
  root "flights#index"
  resources :bookings, only: [:new, :edit]
  resources :flights,  only:  :index do
    resources :bookings
  end
  get 'user/bookings' => "bookings#index"
  get "/auth/:provider/callback" => "sessions#create"
end
