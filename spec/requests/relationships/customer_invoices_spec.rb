require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id/invoices" do
  include SpecHelpers
  it "returns all invoices from the customer" do
    customer1 = create(:customer_with_invoices)
    invoice1 = customer1.invoices.first

    get "/api/v1/customers/#{customer1.id}/invoices"

    expect(response.status).to eq 200
    invoices = parsed_body
    expect(invoices.count).to eq customer1.invoices.count
    invoice_json = invoices.first
    expect(invoice_json["id"]).to eq invoice1.id
    expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
    expect(invoice_json["customer_id"]).to eq invoice1.customer_id
    expect(invoice_json["status"]).to eq invoice1.status
  end
end
