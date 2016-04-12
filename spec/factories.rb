require 'faker'

FactoryGirl.define do
  factory :invoice_item do
    item
    invoice
    quantity Random.rand(25)
    unit_price Random.rand(100..8_000_000)
    created_at "2002-04-30T14:33:06.000Z"
    updated_at "2016-01-28T17:04:57.000Z"
  end

  factory :item do
    name
    description Faker::Lorem.sentence(3)
    unit_price Random.rand(100..8_000_000)
    merchant
    created_at "2002-04-30T14:33:06.000Z"
    updated_at "2016-01-28T17:04:57.000Z"
  end

  factory :transaction do
    invoice
    credit_card_number "4433 1213 1234 8850"
    result "success"
    created_at "2002-04-30T14:33:06.000Z"
    updated_at "2016-01-28T17:04:57.000Z"
  end

  factory :invoice do
    customer
    merchant
    status "shipped"
    created_at "2002-04-30T14:33:06.000Z"
    updated_at "2016-01-28T17:04:57.000Z"
  end

  sequence :first_name do |n|
    Faker::Name.first_name + n.to_s
  end

  sequence :last_name do |n|
    Faker::Name.last_name + n.to_s
  end

  sequence(:name) { |n| Faker::Name.name + n.to_s }

  factory :customer do
    first_name
    last_name
    created_at "2015-09-30T12:54:13.000Z"
    updated_at "2016-02-28T07:14:10.000Z"
  end

  factory :merchant do
    name
    created_at "2015-03-30T14:54:05.000Z"
    updated_at "2016-01-28T08:30:20.000Z"
  end

  factory :merchant_with_items, parent: :merchant do |merchant|
    items { build_list :item, Random.rand(1..6) }
  end

  factory :merchant_with_invoices, parent: :merchant do |merchant|
    invoices { build_list :invoice, Random.rand(1..6) }
  end

  factory :customer_with_invoices, parent: :customer do |customer|
    invoices { build_list :invoice, Random.rand(1..6) }
  end

  factory :invoice_with_transactions, parent: :invoice do |invoice|
    transactions { build_list :transaction, Random.rand(1..6) }
  end

  factory :invoice_with_invoice_items, parent: :invoice do |invoice|
    invoice_items { build_list :invoice_item, Random.rand(1..6) }
  end

  factory :item_with_invoice_items, parent: :item do |item|
    invoice_items { build_list :invoice_item, Random.rand(1..6) }
  end
end
