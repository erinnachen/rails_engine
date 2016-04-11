require "rails_helper"

RSpec.describe "GET /api/v1/customers/:id" do
  include SpecHelpers
  it "returns a single customer" do
    customer1 = create(:customer)

    get "/api/v1/customers/#{customer1.id}"

    expect(response.status).to eq 200
    customer_json = parsed_body
    expect(customer_json["id"]).to eq customer1.id
    expect(customer_json["first_name"]).to eq customer1.first_name
    expect(customer_json["last_name"]).to eq customer1.last_name
  end
end
