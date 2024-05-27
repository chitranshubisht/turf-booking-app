Rails.application.routes.draw do
  devise_for :users
  
  resources :facilities
  resources :bookings, only: [:new, :create]
  
end