require "rails_helper"

RSpec.describe "GET /api/v1/items/:id/best_day" do
  include SpecHelpers
  it "returns best date for sales for a specific item" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    customer1 = create(:customer)
    item = create(:item)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1, created_at: "2015-03-16 01:25:15")
    invoice2 = create(:invoice, customer: customer1, merchant: merchant2, created_at: "2015-03-16 01:25:15")
    invoice3 = create(:invoice, customer: customer1, merchant: merchant1, created_at: "2015-03-25 01:25:15")

    invoice1.transactions << create(:transaction)
    invoice2.transactions << create(:transaction)
    invoice3.transactions << create(:transaction)
    invoice1.invoice_items << create(:invoice_item, item: item, quantity: 3, unit_price: 225)
    invoice2.invoice_items << create(:invoice_item, item: item, quantity: 1, unit_price: 4366)
    invoice2.invoice_items << create(:invoice_item, item: item, quantity: 2, unit_price: 5635)
    invoice3.invoice_items << create(:invoice_item, item_id: item.id, quantity: 5, unit_price: 550)

    get "/api/v1/items/#{item.id}/best_day"

    expect(response.status).to eq 200
    best_day_json = parsed_body
    expect(best_day_json["best_day"]).to eq "2015-03-16T01:25:15.000Z"
  end
end
