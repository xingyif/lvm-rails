FactoryGirl.define do
  factory :enrollment do
    student
    affiliate
    start { Faker::Date.between(1.years.ago, Date.today) }
  end
end
