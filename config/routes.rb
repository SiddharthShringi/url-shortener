Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#index'
  namespace :api do
    namespace :v1 do
      resources :links, only: [ :index, :update ] do
        post 'encode', on: :collection
      end
      resources :links, param: :short_url, only: :decode do
        get 'decode', on: :member
      end
    end
  end
end
