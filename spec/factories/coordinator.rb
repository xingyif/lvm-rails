FactoryGirl.define do
  factory :coordinator do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
  end

  factory :coordinator_with_student, class: Coordinator do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
    after(:create) do |coordinator|
      coordinator.students << FactoryGirl.create(:student)
    end
  end

  factory :coordinator_with_tutor, class: Coordinator do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
    after(:create) do |coordinator|
      coordinator.tutors << FactoryGirl.create(:tutor)
    end
  end

  factory :full_coordinator, class: Coordinator do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { Faker::Base.numerify('(###) ###-####') }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
    after(:create) do |coordinator|
      coordinator.tutors << FactoryGirl.create(:tutor)
      coordinator.students << FactoryGirl.create(:student)
    end
  end
end
