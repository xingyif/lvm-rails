FactoryGirl.define do
  factory :match do
    student
    tutor
    start { Faker::Date.between(1.years.ago, Date.today) }
  end
end
