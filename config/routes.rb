Rails.application.routes.draw do
  devise_for :users
  root "wears#index"

    resources :wears
    resources :users, only: [:show]
    resources :categories, only: [:index]
    delete  'wears/:id' => 'wears#destroy'
    get     'wears/:id/edit' => 'wears#edit'
    patch   'wears/:id'  => 'wears#update'
  end
