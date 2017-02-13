20.times do
  Student.seed do |s|
    s.first_name = Faker::Name.name
  end
end
