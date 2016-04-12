require "rails_helper"

RSpec.describe "GET /api/v1/items/:id/merchant" do
  include SpecHelpers
  it "returns the merchant from the item" do
    item1 = create(:item)
    merchant1 = item1.merchant

    get "/api/v1/items/#{item1.id}/merchant"

    expect(response.status).to eq 200
    merchant_json = parsed_body
    expect(merchant_json["id"]).to eq merchant1.id
    expect(merchant_json["name"]).to eq merchant1.name
  end
end
