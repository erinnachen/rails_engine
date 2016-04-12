require "rails_helper"

RSpec.describe "GET /api/v1/customers/find?param=value" do
  include SpecHelpers
  context "find by id" do
    it "returns a single customer with the given id" do
      customer1 = create(:customer)

      get "/api/v1/customers/find?id=#{customer1.id}"
      expect(response.status).to eq 200
      customer_json = parsed_body
      expect(customer_json["id"]).to eq customer1.id
      expect(customer_json["first_name"]).to eq customer1.first_name
      expect(customer_json["last_name"]).to eq customer1.last_name
    end
  end

  context "find by first_name" do
    it "returns a single customer with first name exact match" do
      customer1 = create(:customer, first_name: "John")

      get "/api/v1/customers/find?first_name=John"

      expect(response.status).to eq 200
      customer_json = parsed_body
      expect(customer_json["id"]).to eq customer1.id
      expect(customer_json["first_name"]).to eq customer1.first_name
    end

    it "returns a single customer with first name (case-insensitive)" do
      customer1 = create(:customer, first_name: "JoHN")

      get "/api/v1/customers/find?first_name=john"

      expect(response.status).to eq 200
      customer_json = parsed_body
      expect(customer_json["id"]).to eq customer1.id
      expect(customer_json["first_name"]).to eq customer1.first_name
    end
  end

  context "find by last_name" do
    it "returns a single customer with last name exact match" do
      customer1 = create(:customer, last_name: "John")

      get "/api/v1/customers/find?last_name=John"

      expect(response.status).to eq 200
      customer_json = parsed_body
      expect(customer_json["id"]).to eq customer1.id
      expect(customer_json["last_name"]).to eq customer1.last_name
    end

    it "returns a single customer with last name (case-insensitive)" do
      customer1 = create(:customer, last_name: "JoHN")

      get "/api/v1/customers/find?last_name=john"

      expect(response.status).to eq 200
      customer_json = parsed_body
      expect(customer_json["id"]).to eq customer1.id
      expect(customer_json["last_name"]).to eq customer1.last_name
    end
  end

  context "find by created_at date" do
    it "returns a single customer" do
      customer1 = create(:customer)

      get "/api/v1/customers/find?created_at=#{customer1.created_at}"

      expect(response.status).to eq 200
      customer_json = parsed_body
      expect(customer_json["id"]).to eq customer1.id
      expect(customer_json["first_name"]).to eq customer1.first_name
    end
  end

  context "find by updated_at date" do
    it "returns a single customer" do
      customer1 = create(:customer)

      get "/api/v1/customers/find?updated_at=#{customer1.updated_at}"

      expect(response.status).to eq 200
      customer_json = parsed_body
      expect(customer_json["id"]).to eq customer1.id
      expect(customer_json["first_name"]).to eq customer1.first_name
    end
  end
end
