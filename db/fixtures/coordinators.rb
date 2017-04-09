13.times do
  Coordinator.seed do |c|
    c.first_name = Faker::Name.first_name
    c.last_name = Faker::Name.last_name
    c.email = Faker::Internet.email
    c.date_of_birth = Faker::Date.between(80.years.ago, 18.years.ago)
    c.phone_number = Faker::Base.numerify('(###) ###-####')
    c.affiliate_id = rand(9) + 1
  end
end
