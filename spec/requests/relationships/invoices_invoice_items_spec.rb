require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/invoice_items" do
  include SpecHelpers
  it "returns all invoice_items from the invoice" do
    invoice1 = create(:invoice_with_invoice_items)
    invoice_item1 = invoice1.invoice_items.first

    get "/api/v1/invoices/#{invoice1.id}/invoice_items"

    expect(response.status).to eq 200
    invoice_items = parsed_body
    expect(invoice_items.count).to eq invoice1.invoice_items.count
    invoice_item_json = invoice_items.first
    expect(invoice_item_json["id"]).to eq invoice_item1.id
    expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
    expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
    expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
    expect(invoice_item_json["unit_price"]).to eq invoice_item1.unit_price
  end
end
