FactoryGirl.define do
  factory :affiliate do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    email { Faker::Internet.email }
    zip { Faker::Base.numerify('#####') }
    city { Faker::Address.city }
    state { ApplicationHelper.us_states.sample[0] }
  end
end
