require "rails_helper"

RSpec.describe "GET /api/v1/items/:id" do
  include SpecHelpers
  it "returns a single item" do
    item1 = create(:item)

    get "/api/v1/items/#{item1.id}"

    expect(response.status).to eq 200
    item_json = parsed_body
    expect(item_json["id"]).to eq item1.id
    expect(item_json["name"]).to eq item1.name
    expect(item_json["description"]).to eq item1.description
    expect(item_json["unit_price"]).to eq item1.unit_price
    expect(item_json["merchant_id"]).to eq item1.merchant_id
  end
end
