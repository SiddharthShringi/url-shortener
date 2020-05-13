Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "links" => "links#create" 
  get "/link/:short_url" => "links#show", as: :short_url
end
