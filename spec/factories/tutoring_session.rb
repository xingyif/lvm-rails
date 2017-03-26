FactoryGirl.define do
  factory :tutoring_session do
    location { Faker::Address.street_address }
    start_time { Faker::Time.between(30.days.ago, Date.today, :day) }
    end_time { Faker::Time.between(30.days.ago, Date.today, :day) }
    session_comment { Faker::Friends.quote }
  end
end
