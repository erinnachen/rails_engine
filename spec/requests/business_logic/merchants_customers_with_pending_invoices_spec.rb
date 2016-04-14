require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/customers_with_pending_invoices" do
  include SpecHelpers
  it "returns customers where an invoice has at least one failed transaction" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer2, merchant: merchant1)
    invoice3 = create(:invoice, customer: customer3, merchant: merchant1)
    invoice4 = create(:invoice, customer: customer2, merchant: merchant1)

    invoice1.transactions << create(:transaction)
    invoice1.transactions << create(:transaction, result: "failed")
    invoice2.transactions << create(:transaction)
    invoice3.transactions << create(:transaction, result: "failed")

    get "/api/v1/merchants/#{merchant1.id}/customers_with_pending_invoices"

    expect(response.status).to eq 200
    customers = parsed_body
    customer_json = customers.first
    expect(customers.count).to eq 2
    ids = customers.map {|customer| customer["id"]}
    expect(ids.sort).to eq [customer1.id, customer3.id]
  end
end
