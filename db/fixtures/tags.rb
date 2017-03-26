20.times do
  Tag.seed do |t|
    t.name = Faker::Lorem.sentence(1, false, 2)
  end
end
