FactoryGirl.define do
  factory :tag do
    name { Faker::Lorem.sentence(1, false, 2).delete("'") }
  end
end
