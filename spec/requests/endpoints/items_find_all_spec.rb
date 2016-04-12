require "rails_helper"

RSpec.describe "GET /api/v1/items/find_all?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a collection containing a single item" do
      item1 = create(:item)
      item2 = create(:item)

      get "/api/v1/items/find_all?id=#{item1.id}"
      expect(response.status).to eq 200
      item_json = parsed_body.first
      expect(item_json["id"]).to eq item1.id
      expect(item_json["name"]).to eq item1.name
      expect(item_json["description"]).to eq item1.description
      expect(item_json["unit_price"]).to eq item1.unit_price
      expect(item_json["merchant_id"]).to eq item1.merchant_id
    end
  end

  context "find by merchant id" do
    it "returns a collection of items" do
      item1 = create(:item)
      item2 = create(:item, merchant_id: item1.merchant_id)

      get "/api/v1/items/find_all?merchant_id=#{item1.merchant_id}"
      expect(response.status).to eq 200
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

  context "find all by name" do
    it "returns a collection of items with name(case-insensitive)" do
      item1 = create(:item, name: "bottle")
      item2 = create(:item, name: "BOTTLE")
      item3 = create(:item, name: "BOTtle")
      item4 = create(:item, name: "Candle")

      get "/api/v1/items/find_all?name=Bottle"

      expect(response.status).to eq 200

      items = parsed_body
      expect(items.count).to eq 3
      item_json = items.first
      expect(item_json["id"]).to eq item1.id
      expect(item_json["name"]).to eq item1.name
      expect(item_json["description"]).to eq item1.description
      expect(item_json["unit_price"]).to eq item1.unit_price
      expect(item_json["merchant_id"]).to eq item1.merchant_id
    end
  end

  context "find all by description" do
    it "returns a collection of items with description(case-insensitive)" do
      item1 = create(:item, description: "bottle")
      item2 = create(:item, description: "BOTTLE")
      item3 = create(:item, description: "BOTtle")
      item4 = create(:item, description: "Candle")

      get "/api/v1/items/find_all?description=Bottle"

      expect(response.status).to eq 200

      items = parsed_body
      expect(items.count).to eq 3
      item_json = items.first
      expect(item_json["id"]).to eq item1.id
      expect(item_json["name"]).to eq item1.name
      expect(item_json["description"]).to eq item1.description
      expect(item_json["unit_price"]).to eq item1.unit_price
      expect(item_json["merchant_id"]).to eq item1.merchant_id
    end
  end

  context "find all by unit price" do
    it "returns a collection of items with unit_price" do
      item1 = create(:item, unit_price: 33500)
      item2 = create(:item, unit_price: 4000)
      item3 = create(:item, unit_price: 1500)
      item4 = create(:item, unit_price: 33500)

      get "/api/v1/items/find_all?unit_price=33500"

      expect(response.status).to eq 200

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

  context "find all by created_at date" do
    it "returns a collection of items" do
      item1 = create(:item, created_at: "2016-04-04T14:54:05.000Z")
      item2 = create(:item, created_at: "2016-04-04T14:54:05.000Z")

      get "/api/v1/items/find_all?created_at=#{item1.created_at}"

      expect(response.status).to eq 200
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

  context "find by updated_at date" do
    it "returns a collection of items" do
      item1 = create(:item, updated_at: "2016-04-01T14:54:05.000Z")
      item2 = create(:item, updated_at: "2016-04-01T14:54:05.000Z")
      item3 = create(:item, updated_at: "2012-09-30T02:54:05.000Z")
      get "/api/v1/items/find_all?updated_at=#{item1.updated_at}"

      expect(response.status).to eq 200
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
end
