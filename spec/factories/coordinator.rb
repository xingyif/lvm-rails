FactoryGirl.define do
  factory :coordinator do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
  end

  factory :coordinator_with_student, class: Coordinator do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
    after(:create) do |coordinator|
      coordinator.students << FactoryGirl.create(:student)
    end
  end

  factory :coordinator_with_tutor, class: Coordinator do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
    after(:create) do |coordinator|
      coordinator.tutors << FactoryGirl.create(:tutor)
    end
  end

  factory :full_coordinator, class: Coordinator do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
    after(:create) do |coordinator|
      coordinator.tutors << FactoryGirl.create(:tutor)
      coordinator.students << FactoryGirl.create(:student)
    end
  end
end
