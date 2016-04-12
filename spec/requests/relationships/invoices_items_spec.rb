require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/items" do
  include SpecHelpers
  it "returns all items from the invoice" do
    invoice1 = create(:invoice_with_invoice_items)
    item1 = invoice1.items.first

    get "/api/v1/invoices/#{invoice1.id}/items"

    expect(response.status).to eq 200
    items = parsed_body
    expect(items.count).to eq invoice1.items.count
    item_json = items.first
    expect(item_json["id"]).to eq item1.id
    expect(item_json["name"]).to eq item1.name
    expect(item_json["description"]).to eq item1.description
    expect(item_json["unit_price"]).to eq format_price(item1.unit_price)
    expect(item_json["merchant_id"]).to eq item1.merchant_id
  end
end
