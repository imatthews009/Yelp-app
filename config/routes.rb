Rails.application.routes.draw do
  resources :yelps, only: [:index]
  post "/yelps/show" => "yelps#show"
end
