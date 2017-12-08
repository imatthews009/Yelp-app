Rails.application.routes.draw do
  root to: "yelps#index"
  resources :yelps, only: [:index]
  post "/yelps/show" => "yelps#show"
end
