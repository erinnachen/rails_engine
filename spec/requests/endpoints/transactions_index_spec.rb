require "rails_helper"

RSpec.describe "GET /api/v1/transactions" do
  include SpecHelpers
  it "returns all transactions in, lowest id first" do
    transaction1 = create(:transaction)
    transaction2 = create(:transaction)

    get "/api/v1/transactions"

    expect(response.status).to eq 200
    expect(parsed_body.count).to eq 2

    transaction_json = parsed_body.first
    expect(transaction_json["id"]).to eq transaction1.id
    expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
    expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
    expect(transaction_json["result"]).to eq transaction1.result
  end
end
