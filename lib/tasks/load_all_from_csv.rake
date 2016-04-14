require 'rake'
require 'csv'

namespace :import_csv do
  task all: [:load_merchants, :load_customers, :load_invoices, :load_items,
             :load_transactions, :load_invoice_items]
end
