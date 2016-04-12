require "rails_helper"

RSpec.describe "GET /api/v1/invoice_items/random" do
  include SpecHelpers
  it "returns a random invoice_item" do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    invoice_item3 = create(:invoice_item)

    get "/api/v1/invoice_items/random"

    expect(response.status).to eq 200
    invoice_item_json = parsed_body
    expect(invoice_item_json["id"]).to_not be_nil
    expect(invoice_item_json["item_id"]).to_not be_nil
    expect(invoice_item_json["invoice_id"]).to_not be_nil
    expect(invoice_item_json["quantity"]).to_not be_nil
    expect(invoice_item_json["unit_price"]).to_not be_nil
  end
end
