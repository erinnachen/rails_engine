require "rails_helper"

RSpec.describe "GET /api/v1/transactions/:id/invoice" do
  include SpecHelpers
  it "returns the invoice associated with the transaction" do
    transaction = create(:transaction)
    invoice1 = transaction.invoice

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response.status).to eq 200
    invoice_json = parsed_body
    expect(invoice_json["id"]).to eq invoice1.id
    expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
    expect(invoice_json["customer_id"]).to eq invoice1.customer_id
    expect(invoice_json["status"]).to eq invoice1.status
  end
end
