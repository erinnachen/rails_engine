require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/find?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a single invoice_item with the given id" do
      invoice_item1 = create(:invoice_item)

      get "/api/v1/invoice_items/find?id=#{invoice_item1.id}"
      expect(response.status).to eq 200
      invoice_item_json = parsed_body
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq format_price(invoice_item1.unit_price)
    end
  end

  context "find by invoice id" do
    it "returns a single invoice_item with the invoice id" do
      invoice_item1 = create(:invoice_item)

      get "/api/v1/invoice_items/find?invoice_id=#{invoice_item1.invoice_id}"
      expect(response.status).to eq 200
      invoice_item_json = parsed_body
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq format_price(invoice_item1.unit_price)
    end
  end

  context "find by item id" do
    it "returns a single invoice_item with the item id" do
      invoice_item1 = create(:invoice_item)

      get "/api/v1/invoice_items/find?item_id=#{invoice_item1.item_id}"
      expect(response.status).to eq 200
      invoice_item_json = parsed_body
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq format_price(invoice_item1.unit_price)
    end
  end

  context "find by quantity" do
    it "returns a single invoice_item with the quantity" do
      invoice_item1 = create(:invoice_item)

      get "/api/v1/invoice_items/find?quantity=#{invoice_item1.quantity}"
      expect(response.status).to eq 200
      invoice_item_json = parsed_body
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq format_price(invoice_item1.unit_price)
    end
  end

  context "find by unit_price" do
    it "returns a single invoice_item with the unit_price" do
      invoice_item1 = create(:invoice_item)

      get "/api/v1/invoice_items/find?unit_price=#{format_price(invoice_item1.unit_price)}"
      expect(response.status).to eq 200
      invoice_item_json = parsed_body
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq format_price(invoice_item1.unit_price)
    end
  end

  context "find by created_at date" do
    it "returns a single invoice_item" do
      invoice_item1 = create(:invoice_item)

      get "/api/v1/invoice_items/find?created_at=#{invoice_item1.created_at}"

      expect(response.status).to eq 200
      invoice_item_json = parsed_body
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq format_price(invoice_item1.unit_price)
    end
  end

  context "find by updated_at date" do
    it "returns a single invoice_item" do
      invoice_item1 = create(:invoice_item)

      get "/api/v1/invoice_items/find?updated_at=#{invoice_item1.updated_at}"

      expect(response.status).to eq 200
      invoice_item_json = parsed_body
      expect(invoice_item_json["id"]).to eq invoice_item1.id
      expect(invoice_item_json["item_id"]).to eq invoice_item1.item_id
      expect(invoice_item_json["invoice_id"]).to eq invoice_item1.invoice_id
      expect(invoice_item_json["quantity"]).to eq invoice_item1.quantity
      expect(invoice_item_json["unit_price"]).to eq format_price(invoice_item1.unit_price)
    end
  end
end
