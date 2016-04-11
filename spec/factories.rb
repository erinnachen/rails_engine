FactoryGirl.define do
  factory :merchant do
    sequence(:name) { |n|  "Merchant #{n}" }
    created_at "2015-03-30T14:54:05.000Z"
    updated_at "2016-09-28T08:30:20.000Z"
  end
end
