require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items" do
  include SpecHelpers
  it "returns all invoice_items in, lowest id first" do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)

    get "/api/v1/invoice_items"

    expect(response.status).to eq 200
    expect(parsed_body.count).to eq 2

    invoice_item_json = parsed_body.first
    expect(invoice_item_json["id"]).to eq invoice_item1.id
    expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
    expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
    expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
    expect(invoice_item_json["unit_price"]).to eq invoice_item1.unit_price
  end
end
