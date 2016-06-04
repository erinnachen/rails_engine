require "rails_helper"

RSpec.describe "GET /api/v1/merchants/most_revenue?quantity=" do
  include SpecHelpers
  it "returns top merchants ranked by revenue" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer1, merchant: merchant2)
    invoice3 = create(:invoice, customer: customer1, merchant: merchant1)

    invoice1.transactions << create(:transaction)
    invoice2.transactions << create(:transaction)
    invoice3.transactions << create(:transaction)
    invoice1.invoice_items << create(:invoice_item, quantity: 3, unit_price: 225)
    invoice2.invoice_items << create(:invoice_item, quantity: 1, unit_price: 4366)
    invoice2.invoice_items << create(:invoice_item, quantity: 2, unit_price: 5635)
    invoice3.invoice_items << create(:invoice_item, quantity: 5, unit_price: 550)

    get "/api/v1/merchants/most_revenue?quantity=1"

    expect(response.status).to eq 200
    merchants = parsed_body
    expect(merchants.count).to eq 1
    merchant_json = merchants.first
    expect(merchant_json["id"]).to eq merchant2.id
    expect(merchant_json["name"]).to eq merchant2.name

    get "/api/v1/merchants/most_revenue?quantity=2"

    expect(response.status).to eq 200
    merchants = parsed_body
    expect(merchants.count).to eq 2
    merchant_json = merchants.last
    expect(merchant_json["id"]).to eq merchant1.id
    expect(merchant_json["name"]).to eq merchant1.name
  end
end
