20.times do
  Coordinator.seed do |c|
    c.name = Faker::Name.name
    c.email = Faker::Internet.email
  end
end
