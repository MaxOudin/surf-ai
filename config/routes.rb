Rails.application.routes.draw do
  devise_for :users
  root to: "boards#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :boards, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :boards, only: %i[new create]
  end
  resources :boards, only: %i[index show] do
    resources :bookings, only: %i[create]
  end
end
