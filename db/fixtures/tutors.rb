20.times do
  Tutor.seed do |t|
    t.first_name = Faker::Name.first_name
    t.last_name = Faker::Name.last_name
    t.email = Faker::Internet.email
  end
end
