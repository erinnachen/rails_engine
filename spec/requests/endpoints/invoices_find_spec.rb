require "rails_helper"

RSpec.describe "GET /api/v1/invoices/find?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a single invoice with the given id" do
      invoice1 = create(:invoice)

      get "/api/v1/invoices/find?id=#{invoice1.id}"
      expect(response.status).to eq 200
      invoice_json = parsed_body
      expect(invoice_json["id"]).to eq invoice1.id
      expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice1.customer_id
      expect(invoice_json["status"]).to eq invoice1.status
    end
  end

  context "find by merchant id" do
    it "returns a single invoice with the merchant id" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, merchant_id: invoice1.merchant.id)

      get "/api/v1/invoices/find?merchant_id=#{invoice1.merchant_id}"
      expect(response.status).to eq 200
      invoice_json = parsed_body
      expect(invoice_json["id"]).to eq invoice1.id
      expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice1.customer_id
      expect(invoice_json["status"]).to eq invoice1.status
    end
  end

  context "find by merchant id" do
    it "returns a single invoice with the merchant id" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, customer_id: invoice1.customer.id)

      get "/api/v1/invoices/find?customer_id=#{invoice1.customer_id}"
      expect(response.status).to eq 200
      invoice_json = parsed_body
      expect(invoice_json["id"]).to eq invoice1.id
      expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice1.customer_id
      expect(invoice_json["status"]).to eq invoice1.status
    end
  end

  context "find by status" do
    it "returns a single invoice with status match (case-insensitive)" do
      invoice1 = create(:invoice, status: "PEndINg")

      get "/api/v1/invoices/find?status=pending"

      expect(response.status).to eq 200
      invoice_json = parsed_body
      expect(invoice_json["id"]).to eq invoice1.id
      expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice1.customer_id
      expect(invoice_json["status"]).to eq invoice1.status
    end
  end
  #   it "returns a single invoice with first name (case-insensitive)" do
  #     invoice1 = create(:invoice, first_name: "JoHN")
  #
  #     get "/api/v1/invoices/find?first_name=john"
  #
  #     expect(response.status).to eq 200
  #     invoice_json = parsed_body
  #     expect(invoice_json["id"]).to eq invoice1.id
  #     expect(invoice_json["first_name"]).to eq invoice1.first_name
  #   end
  # end
  #
  # context "find by last_name" do
  #   it "returns a single invoice with last name exact match" do
  #     invoice1 = create(:invoice, last_name: "John")
  #
  #     get "/api/v1/invoices/find?last_name=John"
  #
  #     expect(response.status).to eq 200
  #     invoice_json = parsed_body
  #     expect(invoice_json["id"]).to eq invoice1.id
  #     expect(invoice_json["last_name"]).to eq invoice1.last_name
  #   end
  #
  #   it "returns a single invoice with last name (case-insensitive)" do
  #     invoice1 = create(:invoice, last_name: "JoHN")
  #
  #     get "/api/v1/invoices/find?last_name=john"
  #
  #     expect(response.status).to eq 200
  #     invoice_json = parsed_body
  #     expect(invoice_json["id"]).to eq invoice1.id
  #     expect(invoice_json["last_name"]).to eq invoice1.last_name
  #   end
  # end
  #
  context "find by created_at date" do
    it "returns a single invoice" do
      invoice1 = create(:invoice)

      get "/api/v1/invoices/find?created_at=#{invoice1.created_at}"

      expect(response.status).to eq 200
      invoice_json = parsed_body
      expect(invoice_json["id"]).to eq invoice1.id
      expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice1.customer_id
      expect(invoice_json["status"]).to eq invoice1.status
    end
  end

  context "find by updated_at date" do
    it "returns a single invoice" do
      invoice1 = create(:invoice)

      get "/api/v1/invoices/find?updated_at=#{invoice1.updated_at}"

      expect(response.status).to eq 200
      invoice_json = parsed_body
      expect(invoice_json["id"]).to eq invoice1.id
      expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice1.customer_id
      expect(invoice_json["status"]).to eq invoice1.status
    end
  end
end
