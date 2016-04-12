require 'rake'
require 'csv'

namespace :import_csv do
  desc "Load transactions"
  task load_transactions: :environment do
    contents = CSV.open "lib/support/transactions.csv", headers: true
    contents.each do |row|
      row_hash = row.to_hash
      row_hash.delete("credit_card_expiration_date")
      transaction = Transaction.create!(row_hash)
      puts "Created: #{transaction.id} #{transaction.invoice_id}"
    end
  end
end
