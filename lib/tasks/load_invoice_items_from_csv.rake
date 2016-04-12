require 'rake'
require 'csv'

namespace :import_csv do
  desc "Load invoice_items"
  task load_invoice_items: :environment do
    contents = CSV.open "lib/support/invoice_items.csv", headers: true
    contents.each do |row|
      invoice_item = InvoiceItem.create!(row.to_hash)
      puts "Created: #{invoice_item.id}"
    end
  end
end
