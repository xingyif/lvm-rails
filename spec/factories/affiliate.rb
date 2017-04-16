FactoryGirl.define do
  factory :affiliate do
    name { Faker::Name.name.delete("'") }
    address { Faker::Address.street_address }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    email { Faker::Internet.email }
    zip { Faker::Base.numerify('#####') }
    city { Faker::Address.city.delete("'") }
    state { ApplicationHelper.us_states.sample[0] }
  end
end
