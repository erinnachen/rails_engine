require "rails_helper"

RSpec.describe "GET /api/v1/invoices" do
  include SpecHelpers
  it "returns a collection of all invoices" do
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)

    get "/api/v1/invoices"
    invoices = parsed_body
    expect(invoices.count).to eq 2
    invoice_json = invoices.first
    expect(invoice_json["id"]).to eq invoice1.id
    expect(invoice_json["customer_id"]).to eq invoice1.customer_id
    expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
    expect(invoice_json["status"]).to eq invoice1.status
  end
end
