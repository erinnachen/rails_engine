require 'rake'
require 'csv'

namespace :import_csv do
  desc "Load customers"
  task load_customers: :environment do
    contents = CSV.open "lib/support/customers.csv", headers: true
    contents.each do |row|
      customer = Customer.create!(row.to_hash)
      puts "Created: #{customer.id} #{customer.first_name} #{customer.last_name}"
    end
  end
end
