Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes
  resources :users, only: [:show, :edit, :update]

  scope module: :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
end
