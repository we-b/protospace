Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes
  resources :users, only: [:show, :edit, :update]

  scope module: :prototypes do
    resources :popular, only: :index
    resources :newest, only: :index
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    resources :tags, only: [:index, :show], param: :tag_name
  end
end
