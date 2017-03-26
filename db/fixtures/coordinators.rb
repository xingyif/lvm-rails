20.times do
  Coordinator.seed do |c|
    c.name = Faker::Name.name
    c.email = Faker::Internet.email
    c.date_of_birth = Faker::Date.between(80.years.ago, 18.years.ago)
    c.phone_number = Faker::Base.numerify('(###) ###-####')
  end
end
