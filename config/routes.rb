Rails.application.routes.draw do
  devise_for :users
  root to: "clothing#index"

    resources :clothings
    resources :users, only: [:show]
    resources :categories, only: [:index]
  end