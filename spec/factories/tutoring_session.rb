FactoryGirl.define do
  factory :tutoring_session do
    location { Faker::Address.street_address }
    hours { Faker::Number.between(1, 10) }
    start_date { Faker::Date.between(5.years.ago, 1.day.ago) }
    end_date { Faker::Date.between(5.years.ago, 1.day.ago) }
    session_comment { 'Good Session' }
  end
end
