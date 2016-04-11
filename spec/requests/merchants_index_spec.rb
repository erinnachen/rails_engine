require "rails_helper"

RSpec.describe "GET /api/v1/merchants" do
  include SpecHelpers
  it "returns all merchants in, lowest id first" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)

    get "/api/v1/merchants"

    expect(response.status).to eq 200
    #binding.pry
    expect(parsed_body.count).to eq 2

    merchant_json = parsed_body.first
    expect(merchant_json["id"]).to eq merchant1.id
    expect(merchant_json["name"]).to eq merchant1.name
  end
end
