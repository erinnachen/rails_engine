require "rails_helper"

RSpec.describe "GET /api/v1/merchants/revenue?date=" do
  include SpecHelpers
  it "returns revenue on a specific date across all merchants" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    customer1 = create(:customer)
    customer2 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1, created_at: "2015-03-16 01:25:15")
    invoice2 = create(:invoice, customer: customer1, merchant: merchant2, created_at: "2015-03-16 01:25:15")
    invoice3 = create(:invoice, customer: customer2, merchant: merchant1, created_at: "2015-03-16 01:25:15")

    invoice1.transactions << create(:transaction)
    invoice2.transactions << create(:transaction)
    invoice3.transactions << create(:transaction)
    invoice1.invoice_items << create(:invoice_item, quantity: 3, unit_price: 225)
    invoice2.invoice_items << create(:invoice_item, quantity: 1, unit_price: 4366)
    invoice2.invoice_items << create(:invoice_item, quantity: 2, unit_price: 5635)
    invoice3.invoice_items << create(:invoice_item, quantity: 5, unit_price: 550)

    get "/api/v1/merchants/revenue?date=2015-03-16%2001:25:15"

    expect(response.status).to eq 200
    revenue_json = parsed_body
    expect(revenue_json["total_revenue"]).to eq "190.61"
  end
end
