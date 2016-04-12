require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/merchant" do
  include SpecHelpers
  it "returns the merchant from the invoice" do
    invoice1 = create(:invoice)
    merchant1 = invoice1.merchant

    get "/api/v1/invoices/#{invoice1.id}/merchant"

    expect(response.status).to eq 200
    merchant_json = parsed_body
    expect(merchant_json["id"]).to eq merchant1.id
    expect(merchant_json["name"]).to eq merchant1.name
  end
end
