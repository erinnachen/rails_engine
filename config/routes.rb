Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        collection do
          get 'find', to: "merchants_finder#show"
          get 'find_all', to: "merchants_finder#index"
          get 'random', to: "merchants_random#show"
          get 'most_revenue', to: "merchants#most_revenue"
          get 'revenue', to: 'merchants#total_revenue'
          get 'most_items', to: "merchants#most_items"
        end
        member do
          get 'items', to: "merchants#items"
          get 'invoices', to: "merchants#invoices"
          get 'customers_with_pending_invoices', to: "merchants#pending_invoice_customers"
          get 'favorite_customer', to: "merchants#favorite_customer"
          get 'revenue', to: "merchants#revenue"
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get 'find', to: "customers_finder#show"
          get 'find_all', to: "customers_finder#index"
          get 'random', to: "customers_random#show"
        end
        member do
          get 'invoices', to: "customers#invoices"
          get 'transactions', to: "customers#transactions"
          get 'favorite_merchant', to: "customers#favorite_merchant"
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get 'find', to: "invoices_finder#show"
          get 'find_all', to: "invoices_finder#index"
          get 'random', to: "invoices_random#show"
        end
        member do
          get 'transactions', to: "invoices#transactions"
          get 'invoice_items', to: "invoices#invoice_items"
          get 'items', to: "invoices#items"
          get 'customer', to: "invoices#customer"
          get 'merchant', to: "invoices#merchant"
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get 'find', to: "transactions_finder#show"
          get 'find_all', to: "transactions_finder#index"
          get 'random', to: "transactions_random#show"
        end
        member do
          get 'invoice', to: "transactions#invoice"
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get 'find', to: "items_finder#show"
          get 'find_all', to: "items_finder#index"
          get 'random', to: "items_random#show"
          get 'most_items', to: "items#most_items"
          get 'most_revenue', to: "items#most_revenue"
        end
        member do
          get 'invoice_items', to: "items#invoice_items"
          get 'merchant', to: "items#merchant"
          get 'best_day', to: "items#best_day"
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'find', to: "invoice_items_finder#show"
          get 'find_all', to: "invoice_items_finder#index"
          get 'random', to: "invoice_items_random#show"
        end
        member do
          get 'item', to: "invoice_items#item"
          get 'invoice', to: "invoice_items#invoice"
        end
      end

    end
  end
end
