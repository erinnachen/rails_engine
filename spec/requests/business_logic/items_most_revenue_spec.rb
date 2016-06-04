require "rails_helper"

RSpec.describe "GET /api/v1/items/most_revenue?quantity=" do
  include SpecHelpers
  it "returns top items ranked by revenue" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    customer1 = create(:customer)
    item1     = create(:item)
    item2     = create(:item)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer1, merchant: merchant2)
    invoice3 = create(:invoice, customer: customer1, merchant: merchant1)

    invoice1.transactions << create(:transaction)
    invoice2.transactions << create(:transaction)
    invoice3.transactions << create(:transaction)
    invoice1.invoice_items << create(:invoice_item, item: item1, quantity: 3, unit_price: 225)
    invoice2.invoice_items << create(:invoice_item, item: item1, quantity: 1, unit_price: 4366)
    invoice2.invoice_items << create(:invoice_item, item: item1, quantity: 2, unit_price: 5635)
    invoice3.invoice_items << create(:invoice_item, item: item2, quantity: 5, unit_price: 550)

    get "/api/v1/items/most_revenue?quantity=1"

    expect(response.status).to eq 200
    items = parsed_body
    expect(items.count).to eq 1
    item_json = items.first
    expect(item_json["id"]).to eq item1.id
    expect(item_json["name"]).to eq item1.name

    get "/api/v1/items/most_revenue?quantity=2"

    expect(response.status).to eq 200
    items = parsed_body
    expect(items.count).to eq 2
    item_json = items.last
    expect(item_json["id"]).to eq item2.id
    expect(item_json["name"]).to eq item2.name
  end
end
