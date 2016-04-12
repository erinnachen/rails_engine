require "rails_helper"

RSpec.describe "GET /api/v1/invoices/find_all?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a collection containing a single invoice" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)

      get "/api/v1/invoices/find_all?id=#{invoice1.id}"
      expect(response.status).to eq 200
      invoices = parsed_body
      expect(invoices.count).to eq 1
      invoice_json = invoices.first
      expect(invoice_json["id"]).to eq invoice1.id
      expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice1.customer_id
      expect(invoice_json["status"]).to eq invoice1.status
    end
  end

  context "find all by merchant_id" do
    it "returns a collection of invoices" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, merchant_id: invoice1.merchant_id)
      invoice3 = create(:invoice, merchant_id: invoice1.merchant_id)

      get "/api/v1/invoices/find_all?merchant_id=#{invoice1.merchant_id}"
      expect(response.status).to eq 200
      invoices = parsed_body
      invoice_json = invoices.first
      expect(invoices.count).to eq 3
      expect(invoice_json["id"]).to eq invoice1.id
      expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice1.customer_id
      expect(invoice_json["status"]).to eq invoice1.status
    end
  end

  context "find all by customer_id" do
    it "returns a collection of invoices" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, customer_id: invoice1.customer_id)
      invoice3 = create(:invoice, customer_id: invoice1.customer_id)

      get "/api/v1/invoices/find_all?customer_id=#{invoice1.customer_id}"
      expect(response.status).to eq 200
      invoices = parsed_body
      invoice_json = invoices.first
      expect(invoices.count).to eq 3
      expect(invoice_json["id"]).to eq invoice1.id
      expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice1.customer_id
      expect(invoice_json["status"]).to eq invoice1.status
    end
  end

  context "find all by status" do
    it "returns a collection of invoices with status (case-insensitive)" do
      invoice1 = create(:invoice, status: "pending")
      invoice2 = create(:invoice, status: "PENDING")
      invoice3 = create(:invoice, status: "peNDing")
      invoice4 = create(:invoice, status: "shipped")

      get "/api/v1/invoices/find_all?status=John"

      expect(response.status).to eq 200

      invoices = parsed_body
      expect(invoices.count).to eq 3
      invoice_json = invoices.first
      expect(invoice_json["id"]).to eq invoice1.id
      expect(invoice_json["merchant_id"]).to eq invoice1.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice1.customer_id
      expect(invoice_json["status"]).to eq invoice1.status
    end
  end

  context "find all by created_at date" do
    it "returns a collection of invoices" do
      invoice1 = create(:invoice, created_at: "2016-04-01T14:54:05.000Z")
      invoice2 = create(:invoice, created_at: "2012-09-30T02:54:05.000Z")
      invoice3 = create(:invoice, created_at: "2016-04-01T14:54:05.000Z")
      get "/api/v1/invoices/find_all?created_at=#{invoice2.created_at}"

      expect(response.status).to eq 200
      invoices = parsed_body
      expect(invoices.count).to eq 1
      invoice_json = invoices.first
      expect(invoice_json["id"]).to eq invoice2.id
      expect(invoice_json["merchant_id"]).to eq invoice2.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice2.customer_id
      expect(invoice_json["status"]).to eq invoice2.status
    end
  end

  context "find all by updated_at date" do
    it "returns a collection of invoices" do
      invoice1 = create(:invoice, updated_at: "2016-04-01T14:54:05.000Z")
      invoice2 = create(:invoice, updated_at: "2012-09-30T02:54:05.000Z")
      invoice3 = create(:invoice, updated_at: "2016-04-01T14:54:05.000Z")
      get "/api/v1/invoices/find_all?updated_at=#{invoice2.updated_at}"

      expect(response.status).to eq 200
      invoices = parsed_body
      expect(invoices.count).to eq 1
      invoice_json = invoices.first
      expect(invoice_json["id"]).to eq invoice2.id
      expect(invoice_json["merchant_id"]).to eq invoice2.merchant_id
      expect(invoice_json["customer_id"]).to eq invoice2.customer_id
      expect(invoice_json["status"]).to eq invoice2.status
    end
  end
end
