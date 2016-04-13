Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        collection do
          get 'find', to: "merchants_finder#show"
          get 'find_all', to: "merchants_finder#index"
          get 'random', to: "merchants_random#show"
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
          get 'find', to: "customers_finder#show"
          get 'find_all', to: "customers_finder#index"
          get 'random', to: "customers_random#show"
        end
        member do
          get 'invoices', to: "customers_invoices#index"
          get 'transactions', to: "customers_transactions#index"
          get 'favorite_merchant', to: "customers_favorite_merchants#show"
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get 'find', to: "invoices_finder#show"
          get 'find_all', to: "invoices_finder#index"
          get 'random', to: "invoices_random#show"
        end
        member do
          get 'transactions', to: "invoices_transactions#index"
          get 'invoice_items', to: "invoices_invoice_items#index"
          get 'items', to: "invoices_items#index"
          get 'customer', to: "invoices_customers#show"
          get 'merchant', to: "invoices_merchants#show"
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get 'find', to: "transactions_finder#show"
          get 'find_all', to: "transactions_finder#index"
          get 'random', to: "transactions_random#show"
        end
        member do
          get 'invoice'
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get 'find', to: "items_finder#show"
          get 'find_all', to: "items_finder#index"
          get 'random', to: "items_random#show"
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
          get 'find', to: "invoice_items_finder#show"
          get 'find_all', to: "invoice_items_finder#index"
          get 'random', to: "invoice_items_random#show"
        end
        member do
          get 'item', to: "invoice_items_items#show"
          get 'invoice', to: "invoice_items_invoices#show"
        end
      end

    end
  end
end
