FactoryGirl.define do
  factory :tutor do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
