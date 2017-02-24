FactoryGirl.define do
  factory :affiliate do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    phone_number '777777777'
    email { Faker::Internet.email }
  end
end
