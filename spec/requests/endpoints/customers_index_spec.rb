require "rails_helper"

RSpec.describe "get api/v1/customers.json" do
  include SpecHelpers
  it "returns a collection of all customers" do
    customer1 = create(:customer)
    customer2 = create(:customer)

    get "/api/v1/customers"

    expect(response.status).to eq 200
    customers = parsed_body
    expect(customers.count).to eq 2

    customer_json = customers.first
    expect(customer_json["id"]).to eq customer1.id
    expect(customer_json["first_name"]).to eq customer1.first_name
    expect(customer_json["last_name"]).to eq customer1.last_name
  end
end
