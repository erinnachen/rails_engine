require "rails_helper"

RSpec.describe "GET /api/v1/items/find?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a single item with the given id" do
      item1 = create(:item)

      get "/api/v1/items/find?id=#{item1.id}"
      expect(response.status).to eq 200
      item_json = parsed_body
      expect(item_json["id"]).to eq item1.id
      expect(item_json["name"]).to eq item1.name
      expect(item_json["description"]).to eq item1.description
      expect(item_json["unit_price"]).to eq format_price(item1.unit_price)
      expect(item_json["merchant_id"]).to eq item1.merchant_id
    end
  end

  context "find by merchant id" do
    it "returns a single item with the merchant id" do
      item1 = create(:item)

      get "/api/v1/items/find?merchant_id=#{item1.merchant_id}"
      expect(response.status).to eq 200
      item_json = parsed_body
      expect(item_json["id"]).to eq item1.id
      expect(item_json["name"]).to eq item1.name
      expect(item_json["description"]).to eq item1.description
      expect(item_json["unit_price"]).to eq format_price(item1.unit_price)
      expect(item_json["merchant_id"]).to eq item1.merchant_id
    end
  end

  context "find by name" do
    it "returns a single item with name match (case-insensitive)" do
      item1 = create(:item, name: "Bottle")

      get "/api/v1/items/find?name=bottle"

      expect(response.status).to eq 200
      item_json = parsed_body
      expect(item_json["id"]).to eq item1.id
      expect(item_json["name"]).to eq item1.name
      expect(item_json["description"]).to eq item1.description
      expect(item_json["unit_price"]).to eq format_price(item1.unit_price)
      expect(item_json["merchant_id"]).to eq item1.merchant_id
    end
  end

  context "find by description" do
    it "returns a single item with name match (case-insensitive)" do
      item1 = create(:item, description: "Glorious GLORIOUS bottle")

      get "/api/v1/items/find?description=glorious%20glorious%20bottle"

      expect(response.status).to eq 200
      item_json = parsed_body
      expect(item_json["id"]).to eq item1.id
      expect(item_json["name"]).to eq item1.name
      expect(item_json["description"]).to eq item1.description
      expect(item_json["unit_price"]).to eq format_price(item1.unit_price)
      expect(item_json["merchant_id"]).to eq item1.merchant_id
    end
  end

  context "find by unit price" do
    it "returns a single item with the unit price" do
      item1 = create(:item, unit_price: 56700)

      get "/api/v1/items/find?unit_price=567.00"
      expect(response.status).to eq 200
      item_json = parsed_body
      expect(item_json["id"]).to eq item1.id
      expect(item_json["name"]).to eq item1.name
      expect(item_json["description"]).to eq item1.description
      expect(item_json["unit_price"]).to eq "567.00"
      expect(item_json["merchant_id"]).to eq item1.merchant_id
    end
  end

  context "find by created_at date" do
    it "returns a single item" do
      item1 = create(:item)

      get "/api/v1/items/find?created_at=#{item1.created_at}"

      expect(response.status).to eq 200
      item_json = parsed_body
      expect(item_json["id"]).to eq item1.id
      expect(item_json["name"]).to eq item1.name
      expect(item_json["description"]).to eq item1.description
      expect(item_json["unit_price"]).to eq format_price(item1.unit_price)
      expect(item_json["merchant_id"]).to eq item1.merchant_id
    end
  end


  context "find by updated_at date" do
    it "returns a single item" do
      item1 = create(:item)

      get "/api/v1/items/find?updated_at=#{item1.updated_at}"

      expect(response.status).to eq 200
      item_json = parsed_body
      expect(item_json["id"]).to eq item1.id
      expect(item_json["name"]).to eq item1.name
      expect(item_json["description"]).to eq item1.description
      expect(item_json["unit_price"]).to eq format_price(item1.unit_price)
      expect(item_json["merchant_id"]).to eq item1.merchant_id
    end
  end
end
