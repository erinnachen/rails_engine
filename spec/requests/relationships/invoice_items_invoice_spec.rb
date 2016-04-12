require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/:id/invoice" do
  include SpecHelpers
  it "returns the invoice from the invoice item" do
    invoice_items1 = create(:invoice_item)
    invoice1 = invoice_items1.invoice

    get "/api/v1/invoice_items/#{invoice_items1.id}/invoice"

    expect(response.status).to eq 200
    invoice_json = parsed_body
    expect(invoice_json["id"]).to eq invoice1.id
    expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
    expect(invoice_json["customer_id"]).to eq invoice1.customer_id
    expect(invoice_json["status"]).to eq invoice1.status
  end
end
