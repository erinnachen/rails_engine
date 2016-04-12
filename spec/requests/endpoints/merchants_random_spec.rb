require "rails_helper"

RSpec.describe "GET /api/v1/merchants/random" do
  include SpecHelpers
  it "returns a random merchant" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)

    get "/api/v1/merchants/random"

    expect(response.status).to eq 200
    merchant_json = parsed_body
    expect(merchant_json["id"]).to_not be_nil
    expect(merchant_json["name"]).to_not be_nil
  end
end
