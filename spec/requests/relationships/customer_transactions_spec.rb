require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id/transactions" do
  include SpecHelpers
  it "returns all transactions from the customer" do
    transaction1 = create(:transaction)
    customer1 = transaction1.invoice.customer

    get "/api/v1/customers/#{customer1.id}/transactions"

    expect(response.status).to eq 200
    transactions = parsed_body
    expect(transactions.count).to eq 1
    transaction_json = transactions.first
    expect(transaction_json["id"]).to eq transaction1.id
    expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
    expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
    expect(transaction_json["result"]).to eq transaction1.result
  end
end
