require "rails_helper"

RSpec.describe "GET /api/v1/items" do
  include SpecHelpers
  it "returns a collection of all items" do
    item1 = create(:item)
    item2 = create(:item)

    get "/api/v1/items"
    items = parsed_body
    expect(items.count).to eq 2
    item_json = items.first
    expect(item_json["id"]).to eq item1.id
    expect(item_json["name"]).to eq item1.name
    expect(item_json["description"]).to eq item1.description
    expect(item_json["unit_price"]).to eq item1.unit_price
    expect(item_json["merchant_id"]).to eq item1.merchant_id
  end
end
