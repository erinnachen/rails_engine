require "rails_helper"

RSpec.describe "GET /api/v1/transactions/find_all?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a collection containing a single transaction" do
      transaction1 = create(:transaction)
      transaction2 = create(:transaction)

      get "/api/v1/transactions/find_all?id=#{transaction1.id}"
      expect(response.status).to eq 200
      transaction_json = parsed_body.first
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end

  context "find by invoice id" do
    it "returns a collection of transactions" do
      transaction1 = create(:transaction)
      transaction2 = create(:transaction, invoice_id: transaction1.invoice_id)

      get "/api/v1/transactions/find_all?invoice_id=#{transaction1.invoice_id}"
      expect(response.status).to eq 200
      transactions = parsed_body
      expect(transactions.count).to eq 2
      transaction_json = transactions.first
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end

  context "find all by result" do
    it "returns a collection of transactions with result (case-insensitive)" do
      transaction1 = create(:transaction, result: "Success")
      transaction2 = create(:transaction, result: "success")
      transaction3 = create(:transaction, result: "SucCESS")
      transaction4 = create(:transaction, result: "failed")

      get "/api/v1/transactions/find_all?result=success"

      expect(response.status).to eq 200

      transactions = parsed_body
      expect(transactions.count).to eq 3
      transaction_json = transactions.first
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end

  context "find all by created_at date" do
    it "returns a collection of transactions" do
      transaction1 = create(:transaction, created_at: "2016-04-04T14:54:05.000Z")
      transaction2 = create(:transaction, created_at: "2016-04-04T14:54:05.000Z")

      get "/api/v1/transactions/find_all?created_at=#{transaction1.created_at}"

      expect(response.status).to eq 200
      transactions = parsed_body
      expect(transactions.count).to eq 2
      transaction_json = transactions.first
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end

  context "find by updated_at date" do
    it "returns a collection of transactions" do
      transaction1 = create(:transaction, updated_at: "2016-04-01T14:54:05.000Z")
      transaction2 = create(:transaction, updated_at: "2016-04-01T14:54:05.000Z")
      transaction3 = create(:transaction, updated_at: "2012-09-30T02:54:05.000Z")
      get "/api/v1/transactions/find_all?updated_at=#{transaction1.updated_at}"

      expect(response.status).to eq 200
      transactions = parsed_body
      expect(transactions.count).to eq 2
      transaction_json = transactions.first
      expect(transaction_json["id"]).to eq transaction1.id
      expect(transaction_json["invoice_id"]).to eq transaction1.invoice_id
      expect(transaction_json["credit_card_number"]).to eq transaction1.credit_card_number
      expect(transaction_json["result"]).to eq transaction1.result
    end
  end
end
