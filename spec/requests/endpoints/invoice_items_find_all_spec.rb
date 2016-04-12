require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/find_all?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a collection containing a single invoice_item" do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item)

      get "/api/v1/invoice_items/find_all?id=#{invoice_item2.id}"
      expect(response.status).to eq 200
      invoice_items = parsed_body
      expect(invoice_items.count).to eq 1
      invoice_item_json = invoice_items.first
      expect(invoice_item_json["id"]).to eq invoice_item2.id
      expect(invoice_item_json["item_id"]).to eq invoice_item2.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item2.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item2.quantity
      expect(invoice_item_json["unit_price"]).to eq invoice_item2.unit_price
    end
  end

  context "find all by item id" do
    it "returns a collection of invoice_items" do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item, item_id: invoice_item1.item_id)

      get "/api/v1/invoice_items/find_all?item_id=#{invoice_item1.item_id}"
      expect(response.status).to eq 200
      invoice_items = parsed_body
      expect(invoice_items.count).to eq 2
      invoice_item_json = invoice_items.first
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq invoice_item1.unit_price
    end
  end

  context "find all by invoice id" do
    it "returns a collection of invoice_items" do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item, invoice_id: invoice_item1.invoice_id)

      get "/api/v1/invoice_items/find_all?invoice_id=#{invoice_item1.invoice_id}"
      expect(response.status).to eq 200
      invoice_items = parsed_body
      expect(invoice_items.count).to eq 2
      invoice_item_json = invoice_items.first
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq invoice_item1.unit_price
    end
  end

  context "find all by quantity" do
    it "returns a collection of invoice_items" do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item, quantity: invoice_item1.quantity)

      get "/api/v1/invoice_items/find_all?quantity=#{invoice_item1.quantity}"
      expect(response.status).to eq 200
      invoice_items = parsed_body
      expect(invoice_items.count).to eq 2
      invoice_item_json = invoice_items.first
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq invoice_item1.unit_price
    end
  end

  context "find all by unit price" do
    it "returns a collection of invoice_items" do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item, unit_price: invoice_item1.unit_price)

      get "/api/v1/invoice_items/find_all?unit_price=#{invoice_item1.unit_price}"
      expect(response.status).to eq 200
      invoice_items = parsed_body
      expect(invoice_items.count).to eq 2
      invoice_item_json = invoice_items.first
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq invoice_item1.unit_price
    end
  end

  context "find all by created_at date" do
    it "returns a collection of invoice_items" do
      invoice_item1 = create(:invoice_item, created_at: "2016-04-04T14:54:05.000Z")
      invoice_item2 = create(:invoice_item, created_at: "2016-04-04T14:54:05.000Z")

      get "/api/v1/invoice_items/find_all?created_at=#{invoice_item1.created_at}"

      expect(response.status).to eq 200
      invoice_items = parsed_body
      expect(invoice_items.count).to eq 2
      invoice_item_json = invoice_items.first
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq invoice_item1.unit_price
    end
  end

  context "find by updated_at date" do
    it "returns a collection of invoice_items" do
      invoice_item1 = create(:invoice_item, updated_at: "2016-04-01T14:54:05.000Z")
      invoice_item2 = create(:invoice_item, updated_at: "2012-09-30T02:54:05.000Z")
      invoice_item3 = create(:invoice_item, updated_at: "2016-04-01T14:54:05.000Z")
      get "/api/v1/invoice_items/find_all?updated_at=#{invoice_item2.updated_at}"

      expect(response.status).to eq 200
      invoice_items = parsed_body
      expect(invoice_items.count).to eq 1
      invoice_item_json = invoice_items.first
      expect(invoice_item_json["id"]).to eq invoice_item2.id
      expect(invoice_item_json["item_id"]).to eq invoice_item2.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item2.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item2.quantity
      expect(invoice_item_json["unit_price"]).to eq invoice_item2.unit_price
    end
  end
end
