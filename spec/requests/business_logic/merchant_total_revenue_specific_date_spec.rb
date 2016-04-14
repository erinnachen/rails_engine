require "rails_helper"

RSpec.describe "GET /api/v1/merchants/:id/revenue" do
  include SpecHelpers
  it "returns a merchants revenue for invoices on a specific date" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    customer2 = create(:customer)

    invoice1 = create(:invoice, customer: customer1, merchant: merchant1, created_at: "2012-03-16 11:55:05")
    invoice2 = create(:invoice, customer: customer2, merchant: merchant1, created_at: "2012-03-16 11:55:05")
    invoice3 = create(:invoice, customer: customer2, merchant: merchant1)

    invoice1.transactions << create(:transaction)
    invoice1.transactions << create(:transaction, result: "failed")
    invoice2.transactions << create(:transaction)
    invoice3.transactions << create(:transaction)
    invoice1.invoice_items << create(:invoice_item, quantity: 3, unit_price: 225)
    invoice2.invoice_items << create(:invoice_item, quantity: 1, unit_price: 4366)
    invoice2.invoice_items << create(:invoice_item, quantity: 2, unit_price: 5635)
    invoice3.invoice_items << create(:invoice_item, quantity: 5, unit_price: 550)

    get "/api/v1/merchants/#{merchant1.id}/revenue?date=2012-03-16%2011:55:05"

    expect(response.status).to eq 200
    revenue_json = parsed_body
    expect(revenue_json["revenue"]).to eq "163.11"
  end
end
