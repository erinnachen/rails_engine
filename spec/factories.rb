FactoryGirl.define do
  sequence :first_name do |n|
    Faker::Name.first_name + n.to_s
  end

  sequence :last_name do |n|
    Faker::Name.last_name + n.to_s
  end
  sequence(:name) { |n|  "Merchant #{n}" }

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


end
