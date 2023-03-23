Rails.application.routes.draw do

  get '/home/index'

  namespace "api"do
    resources :brands
    resources :models
    resources :cars
  end
end
