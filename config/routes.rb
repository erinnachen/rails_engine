Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        collection do
          get 'find', to: "merchants_finder#find"
          get 'find_all', to: "merchants_finder#find_all"
          get 'random'
          get 'most_revenue'
          get 'revenue', to: 'merchants#total_revenue'
          get 'most_items'
        end
        member do
          get 'items'
          get 'invoices'
          get 'customers_with_pending_invoices'
          get 'favorite_customer'
          get 'revenue'
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get 'find', to: "customers_finder#find"
          get 'find_all', to: "customers_finder#find_all"
          get 'random', to: "customers_finder#random"
        end
        member do
          get 'invoices'
          get 'transactions'
          get 'favorite_merchant'
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get 'find', to: "invoices_finder#find"
          get 'find_all', to: "invoices_finder#find_all"
          get 'random'
        end
        member do
          get 'transactions'
          get 'invoice_items'
          get 'items'
          get 'customer'
          get 'merchant'
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get 'find', to: "transactions_finder#find"
          get 'find_all', to: "transactions_finder#find_all"
          get 'random'
        end
        member do
          get 'invoice'
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get 'find', to: "items_finder#find"
          get 'find_all', to: "items_finder#find_all"
          get 'random'
          get 'most_items'
        end
        member do
          get 'invoice_items'
          get 'merchant'
          get 'best_day'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'find', to: "invoice_items_finder#find"
          get 'find_all', to: "invoice_items_finder#find_all"
          get 'random'
        end
        member do
          get 'item'
          get 'invoice'
        end
      end

    end
  end
end
