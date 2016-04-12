require 'rake'
require 'csv'

namespace :import_csv do
  desc "Load invoices"
  task load_invoices: :environment do
    contents = CSV.open "lib/support/invoices.csv", headers: true
    contents.each do |row|
      invoice = Invoice.create!(row.to_hash)
      puts "Created: #{invoice.id}"
    end
  end
end
