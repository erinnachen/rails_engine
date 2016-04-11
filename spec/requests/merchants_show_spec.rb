require "rails_helper"

RSpec.describe "GET /api/v1/merchant/:id" do
  include SpecHelpers
  it "returns a single merchant" do
    merchant1 = create(:merchant)

    get "/api/v1/merchants/#{merchant1.id}"

    expect(response.status).to eq 200
    merchant_json = parsed_body
    expect(merchant_json["id"]).to eq merchant1.id
    expect(merchant_json["name"]).to eq merchant1.name
  end
end
