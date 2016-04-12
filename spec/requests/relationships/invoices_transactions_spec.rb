require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/transactions" do
  include SpecHelpers
  it "returns all transactions from the invoice" do
    invoice1 = create(:invoice_with_transactions)
    transaction1 = invoice1.transactions.first

    get "/api/v1/invoices/#{invoice1.id}/transactions"

    expect(response.status).to eq 200
    transactions = parsed_body
    expect(transactions.count).to eq invoice1.transactions.count
    transaction_json = transactions.first
    expect(transaction_json["id"]).to eq transaction1.id
    expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
    expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
    expect(transaction_json["result"]).to eq transaction1.result
  end
end
