matches = [*1..150]

150.times do
  TutoringSession.seed do |t|
    t.match_id        = matches.sample
    t.start_date      = Date.today - 1
    t.end_date        = Date.today
    t.hours           = rand(20) + 1
    t.location        = Faker::Address.city
    t.session_comment = Faker::Lorem.sentence(1, false, 2)
  end
end
