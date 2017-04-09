FactoryGirl.define do
  factory :volunteer_job do
    tutor
    affiliate
    start { Faker::Date.between(1.years.ago, Date.today) }
  end
end
