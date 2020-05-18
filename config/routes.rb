Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#index'
  resources :links, only: :create
  resources :links, param: :short_url, only: :show
end
