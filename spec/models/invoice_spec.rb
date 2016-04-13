require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { should validate_presence_of :merchant_id }
  it { should validate_presence_of :customer_id }
  it { should validate_presence_of :status }
  it { should belong_to :merchant }
  it { should belong_to :customer }
  it { should have_many(:items).through(:invoice_items) }
  it { should have_many :transactions }

  it "should return successful if at least one transaction is successful" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped" )
    invoice.transactions << Transaction.create(credit_card_number:"22", result: "success")
    invoice.transactions << Transaction.create(credit_card_number:"25", result: "success")
    assert invoice.successful?
  end

  it "should return successful if at least one transaction is successful" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped" )
    invoice.transactions << Transaction.create(credit_card_number:"22", result: "failed")
    invoice.transactions << Transaction.create(credit_card_number:"25", result: "success")
    assert invoice.successful?
  end

  it "should return unsuccessful if no transactions successful" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped" )
    invoice.transactions << Transaction.create(credit_card_number:"22", result: "failed")
    invoice.transactions << Transaction.create(credit_card_number:"25", result: "failed")
    refute invoice.successful?
  end
end
