require "rails_helper"

RSpec.describe "GET /api/v1/transactions/find?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a single transaction with the given id" do
      transaction1 = create(:transaction)

      get "/api/v1/transactions/find?id=#{transaction1.id}"
      expect(response.status).to eq 200
      transaction_json = parsed_body
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end

  context "find by invoice id" do
    it "returns a single transaction with the invoice id" do
      transaction1 = create(:transaction)

      get "/api/v1/transactions/find?invoice_id=#{transaction1.invoice_id}"
      expect(response.status).to eq 200
      transaction_json = parsed_body
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end

  context "find by credit card number" do
    it "returns a single transaction with the credit card number" do
      transaction1 = create(:transaction)

      get "/api/v1/transactions/find?credit_card_number=#{transaction1.credit_card_number}"
      expect(response.status).to eq 200
      transaction_json = parsed_body
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end

  context "find by result" do
    it "returns a single transaction with result (case-insensitive)" do
      transaction1 = create(:transaction, result: "sucCEsS")

      get "/api/v1/transactions/find?status=success"

      expect(response.status).to eq 200
      transaction_json = parsed_body
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end

  context "find by created_at date" do
    it "returns a single transaction" do
      transaction1 = create(:transaction)

      get "/api/v1/transactions/find?created_at=#{transaction1.created_at}"

      expect(response.status).to eq 200
      transaction_json = parsed_body
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end

  context "find by updated_at date" do
    it "returns a single transaction" do
      transaction1 = create(:transaction)

      get "/api/v1/transactions/find?updated_at=#{transaction1.updated_at}"

      expect(response.status).to eq 200
      transaction_json = parsed_body
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end
end
