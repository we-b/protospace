Rails.application.routes.draw do
  root 'prototypes#index'

  resources :prototypes
end
