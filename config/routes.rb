Rails.application.routes.draw do
  devise_for :users
  root "wears#index"

  resources :wears
  resources :users, only: [:show]
  resources :categories, only: [:index]
  delete  'wears/:id' => 'wears#destroy'
  get     'wears/:id/edit' => 'wears#edit'
  get     'wears/search' => 'wears#search'
  resources :stories
  patch   'wears/:id'  => 'wears#update'
  resources :wears do
    resources :likes, only: [:create, :destroy]
  end

end
