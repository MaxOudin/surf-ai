Rails.application.routes.draw do
  devise_for :users
  root to: "boards#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :boards, only: [:index]

  resources :users do
    resources :boards, only: %i[new create]
  end
  resources :boards, only: %i[index show] do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[create]
  end
  namespace :admin do
    resources :bookings, only: %i[index show] do
      collection do
        get :rents
      end
    end
    resources :boards, only: %i[index edit update destroy]
  end
end
