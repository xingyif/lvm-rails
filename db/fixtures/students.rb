20.times do
  Student.seed do |s|
    s.name = Faker::Name.name
  end
end
