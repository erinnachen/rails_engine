require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/:id/item" do
  include SpecHelpers
  it "returns the item from the invoice item" do
    invoice_items1 = create(:invoice_item)
    item1 = invoice_items1.item

    get "/api/v1/invoice_items/#{invoice_items1.id}/item"

    expect(response.status).to eq 200
    item_json = parsed_body
    expect(item_json["id"]).to eq item1.id
    expect(item_json["name"]).to eq item1.name
    expect(item_json["description"]).to eq item1.description
    expect(item_json["unit_price"]).to eq item1.unit_price
    expect(item_json["merchant_id"]).to eq item1.merchant_id
  end
end
