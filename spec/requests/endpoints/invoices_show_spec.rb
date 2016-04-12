require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id" do
  include SpecHelpers
  it "returns a single invoice" do
    invoice1 = create(:invoice)

    get "/api/v1/invoices/#{invoice1.id}"

    expect(response.status).to eq 200
    invoice_json = parsed_body
    expect(invoice_json["id"]).to eq invoice1.id
    expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
    expect(invoice_json["customer_id"]).to eq invoice1.customer_id
    expect(invoice_json["status"]).to eq invoice1.status
  end
end
