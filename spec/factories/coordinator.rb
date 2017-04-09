FactoryGirl.define do
  factory :coordinator do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
    affiliate { FactoryGirl.create(:affiliate) }
  end
end
