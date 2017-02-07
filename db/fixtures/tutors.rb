20.times do
  Tutor.seed do |t|
    t.name = Faker::Name.name
    t.email = Faker::Internet.email
  end
end
