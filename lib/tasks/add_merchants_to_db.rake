require 'rake'
require 'csv'

namespace :import_csv do
  desc "Load merchants"
  task load_mechants: :environment do
    contents = CSV.open "lib/support/merchants.csv", headers: true
    contents.each do |row|
      merchant = Merchant.create!(row.to_hash)
      puts "Created: #{merchant.id} #{merchant.name}"
    end
  end

  task load_customers: :environment do
    contents = CSV.open "lib/support/customers.csv", headers: true
    contents.each do |row|
      customer = Customer.create!(row.to_hash)
      puts "Created: #{customer.id} #{customer.first_name} #{customer.last_name}"
    end
  end
end
