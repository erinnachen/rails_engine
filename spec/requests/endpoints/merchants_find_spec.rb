require "rails_helper"

RSpec.describe "GET /api/v1/merchants/find?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a single merchant with the given id" do
      merchant1 = create(:merchant)

      get "/api/v1/merchants/find?id=#{merchant1.id}"
      expect(response.status).to eq 200
      merchant_json = parsed_body
      expect(merchant_json["id"]).to eq merchant1.id
      expect(merchant_json["name"]).to eq merchant1.name
    end
  end

  context "find by name" do
    it "returns a single merchant with name exact match" do
      merchant1 = create(:merchant, name: "John")

      get "/api/v1/merchants/find?name=John"

      expect(response.status).to eq 200
      merchant_json = parsed_body
      expect(merchant_json["id"]).to eq merchant1.id
      expect(merchant_json["name"]).to eq merchant1.name
    end

    it "returns a single merchant with name (case-insensitive)" do
      merchant1 = create(:merchant, name: "JoHN")

      get "/api/v1/merchants/find?name=john"

      expect(response.status).to eq 200
      merchant_json = parsed_body
      expect(merchant_json["id"]).to eq merchant1.id
      expect(merchant_json["name"]).to eq merchant1.name
    end
  end

  context "find by created_at date" do
    it "returns a single merchant" do
      merchant1 = create(:merchant)

      get "/api/v1/merchants/find?created_at=#{merchant1.created_at}"

      expect(response.status).to eq 200
      merchant_json = parsed_body
      expect(merchant_json["id"]).to eq merchant1.id
      expect(merchant_json["name"]).to eq merchant1.name
    end
  end

  context "find by updated_at date" do
    it "returns a single merchant" do
      merchant1 = create(:merchant)

      get "/api/v1/merchants/find?updated_at=#{merchant1.updated_at}"

      expect(response.status).to eq 200
      merchant_json = parsed_body
      expect(merchant_json["id"]).to eq merchant1.id
      expect(merchant_json["name"]).to eq merchant1.name
    end
  end
end
