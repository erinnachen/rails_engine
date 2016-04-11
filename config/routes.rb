Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/merchants/find'
      get '/merchants/find_all'
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
