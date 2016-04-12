require 'rake'
require 'csv'

namespace :import_csv do
  desc "Load items"
  task load_items: :environment do
    contents = CSV.open "lib/support/items.csv", headers: true
    contents.each do |row|
      item = Item.create!(row.to_hash)
      puts "Created: #{item.id} #{item.name}"
    end
  end
end
