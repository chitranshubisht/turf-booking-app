Rails.application.routes.draw do
  devise_for :users

  resources :facilities do
    resources :bookings, only: %i[new create]
  end
end
