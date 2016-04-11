require "rails_helper"

RSpec.describe "GET /api/v1/customers/find_all?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a collection containing a single customer" do
      customer1 = create(:customer)
      customer2 = create(:customer)

      get "/api/v1/customers/find_all?id=#{customer2.id}"
      expect(response.status).to eq 200
      customer_json = parsed_body.first
      expect(customer_json["id"]).to eq customer2.id
      expect(customer_json["first_name"]).to eq customer2.first_name
      expect(customer_json["last_name"]).to eq customer2.last_name
    end
  end

  context "find all by first_name" do
    it "returns a collection of customers with name (case-insensitive)" do
      customer1 = create(:customer, first_name: "John")
      customer2 = create(:customer, first_name: "john")
      customer3 = create(:customer, first_name: "JOHN")
      customer4 = create(:customer, first_name: "not JOHN")

      get "/api/v1/customers/find_all?first_name=John"

      expect(response.status).to eq 200

      customers = parsed_body
      expect(customers.count).to eq 3
      customer_json = customers.first
      expect(customer_json["id"]).to eq customer1.id
      expect(customer_json["first_name"]).to eq customer1.first_name
      expect(customer_json["last_name"]).to eq customer1.last_name
    end
  end

  context "find all by last_name" do
    it "returns a collection of customers with name (case-insensitive)" do
      customer1 = create(:customer, last_name: "Smith")
      customer2 = create(:customer, last_name: "smith")
      customer3 = create(:customer, last_name: "SmITh")
      customer4 = create(:customer, last_name: "not Smith")

      get "/api/v1/customers/find_all?last_name=smith"

      expect(response.status).to eq 200

      customers = parsed_body
      expect(customers.count).to eq 3
      customer_json = customers.first
      expect(customer_json["id"]).to eq customer1.id
      expect(customer_json["first_name"]).to eq customer1.first_name
      expect(customer_json["last_name"]).to eq customer1.last_name
    end
  end

  context "find all by created_at date" do
    it "returns a collection of customers" do
      customer1 = create(:customer, created_at: "2016-04-04T14:54:05.000Z")
      customer2 = create(:customer, created_at: "2016-04-04T14:54:05.000Z")

      get "/api/v1/customers/find_all?created_at=#{customer1.created_at}"

      expect(response.status).to eq 200
      customers = parsed_body
      expect(customers.count).to eq 2
      customer_json = customers.first
      expect(customer_json["id"]).to eq customer1.id
      expect(customer_json["first_name"]).to eq customer1.first_name
      expect(customer_json["last_name"]).to eq customer1.last_name
    end
  end

  context "find by updated_at date" do
    it "returns a collection of customers" do
      customer1 = create(:customer, updated_at: "2016-04-01T14:54:05.000Z")
      customer2 = create(:customer, updated_at: "2012-09-30T02:54:05.000Z")
      customer3 = create(:customer, updated_at: "2016-04-01T14:54:05.000Z")
      get "/api/v1/customers/find_all?updated_at=#{customer2.updated_at}"

      expect(response.status).to eq 200
      customers = parsed_body
      expect(customers.count).to eq 1
      customer_json = customers.first
      expect(customer_json["id"]).to eq customer2.id
      expect(customer_json["first_name"]).to eq customer2.first_name
      expect(customer_json["last_name"]).to eq customer2.last_name
    end
  end
end
