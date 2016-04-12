require "rails_helper"

RSpec.describe "GET /api/v1/transactions/random" do
  include SpecHelpers
  it "returns a random transaction" do
    transaction1 = create(:transaction)
    transaction2 = create(:transaction)
    transaction3 = create(:transaction)

    get "/api/v1/transactions/random"

    expect(response.status).to eq 200
    transaction_json = parsed_body
    expect(transaction_json["id"]).to_not be_nil
    expect(transaction_json["invoice_id"]).to_not be_nil
    expect(transaction_json["credit_card_number"]).to_not be_nil
    expect(transaction_json["result"]).to_not be_nil
  end
end
