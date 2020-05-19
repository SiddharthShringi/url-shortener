Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :links, param: :short_url, only: [:index, :update] do
        get 'decode', on: :member
        post 'encode', on: :collection
      end
    end
  end

  root "static#index"

end
