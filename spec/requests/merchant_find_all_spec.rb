require "rails_helper"

RSpec.describe "GET /api/v1/merchants/find_all?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a collection containing a single merchant" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)

      get "/api/v1/merchants/find_all?id=#{merchant1.id}"
      expect(response.status).to eq 200
      merchant_json = parsed_body.first
      expect(merchant_json["id"]).to eq merchant1.id
      expect(merchant_json["name"]).to eq merchant1.name
    end
  end

  context "find all by name" do
    it "returns a collection of merchants with name (case-insensitive)" do
      merchant1 = create(:merchant, name: "John")
      merchant2 = create(:merchant, name: "john")
      merchant3 = create(:merchant, name: "JOHN")
      merchant4 = create(:merchant, name: "not JOHN")

      get "/api/v1/merchants/find_all?name=John"

      expect(response.status).to eq 200

      merchants = parsed_body
      expect(merchants.count).to eq 3
      merchant_json = merchants.first
      expect(merchant_json["id"]).to eq merchant1.id
      expect(merchant_json["name"]).to eq merchant1.name
    end
  end

  context "find all by created_at date" do
    it "returns a collection of merchants" do
      merchant1 = create(:merchant, created_at: "2016-04-04T14:54:05.000Z")
      merchant2 = create(:merchant, created_at: "2016-04-04T14:54:05.000Z")

      get "/api/v1/merchants/find_all?created_at=#{merchant1.created_at}"

      expect(response.status).to eq 200
      merchants = parsed_body
      expect(merchants.count).to eq 2
      merchant_json = merchants.first
      expect(merchant_json["id"]).to eq merchant1.id
      expect(merchant_json["name"]).to eq merchant1.name
    end
  end

  context "find by updated_at date" do
    it "returns a collection of merchants" do
      merchant1 = create(:merchant, updated_at: "2016-04-01T14:54:05.000Z")
      merchant2 = create(:merchant, updated_at: "2016-04-01T14:54:05.000Z")
      merchant3 = create(:merchant, updated_at: "2012-09-30T02:54:05.000Z")
      get "/api/v1/merchants/find_all?updated_at=#{merchant1.updated_at}"

      expect(response.status).to eq 200
      merchants = parsed_body
      expect(merchants.count).to eq 2
      merchant_json = merchants.first
      expect(merchant_json["id"]).to eq merchant1.id
      expect(merchant_json["name"]).to eq merchant1.name
    end
  end
end
