require "rails_helper"

RSpec.describe "GET /api/v1/invoices/random" do
  include SpecHelpers
  it "returns a random invoice" do
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    invoice3 = create(:invoice)

    get "/api/v1/invoices/random"

    expect(response.status).to eq 200
    invoice_json = parsed_body
    expect(invoice_json["id"]).to_not be_nil
    expect(invoice_json["merchant_id"]).to_not be_nil
    expect(invoice_json["customer_id"]).to_not be_nil
    expect(invoice_json["status"]).to_not be_nil
  end
end
