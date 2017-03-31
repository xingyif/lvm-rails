20.times do
  Student.seed do |s|
    s.first_name = Faker::Name.first_name
    s.last_name  = Faker::Name.last_name
    s.email      = Faker::Internet.email
    s.gender     = ['female', 'male', 'other'].sample
    s.cell_phone = Faker::Base.numerify('(###) ###-####')
    s.work_phone = Faker::Base.numerify('(###) ###-####')
    s.home_phone = Faker::Base.numerify('(###) ###-####')
  end
end
