Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      resources :merchants, only: [:index, :show] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get 'find', to: "customers_finder#find"
          get 'find_all', to: "customers_finder#find_all"
          get 'random', to: "customers_finder#random"
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
    end
  end
end
