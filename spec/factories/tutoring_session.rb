FactoryGirl.define do
  factory :tutoring_session do
    location { Faker::Address.street_address.delete("'") }
    hours { Faker::Number.between(1, 10) }
    start_date { Date.today - 1 }
    end_date { Date.today }
    session_comment { 'Good Session' }
    match
  end
end
