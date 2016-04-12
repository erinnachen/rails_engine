require "rails_helper"

RSpec.describe "GET /api/v1/items/random" do
  include SpecHelpers
  it "returns a random item" do
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)

    get "/api/v1/items/random"

    expect(response.status).to eq 200
    item_json = parsed_body
    expect(item_json["id"]).to_not be_nil
    expect(item_json["name"]).to_not be_nil
    expect(item_json["description"]).to_not be_nil
    expect(item_json["unit_price"]).to_not be_nil
    expect(item_json["merchant_id"]).to_not be_nil
  end
end
