FactoryGirl.define do
  sequence :first_name do |n|
    Faker::Name.first_name + n.to_s
  end

  sequence :last_name do |n|
    Faker::Name.last_name + n.to_s
  end

  factory :customer do
    first_name
    last_name
  end

  factory :merchant do
    sequence(:name) { |n|  "Merchant #{n}" }
    created_at "2015-03-30T14:54:05.000Z"
    updated_at "2016-09-28T08:30:20.000Z"
  end


end
