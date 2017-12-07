Rails.application.routes.draw do
  resources :yelps, only: [:index, :show]
end
