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
end
