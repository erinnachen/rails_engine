Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/customers/find', to: "customers_finder#find"
      get '/customers/find_all', to: "customers_finder#find_all"
      get '/merchants/find'
      get '/merchants/find_all'
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index]
    end
  end
end
