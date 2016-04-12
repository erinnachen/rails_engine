require "rails_helper"

RSpec.describe "GET /api/v1/invoices/:id/customer" do
  include SpecHelpers
  it "returns the customer from the invoice" do
    invoice1 = create(:invoice)
    customer1 = invoice1.customer

    get "/api/v1/invoices/#{invoice1.id}/customer"

    expect(response.status).to eq 200
    customer_json = parsed_body
    expect(customer_json["id"]).to eq customer1.id
    expect(customer_json["first_name"]).to eq customer1.first_name
    expect(customer_json["last_name"]).to eq customer1.last_name
  end
end
