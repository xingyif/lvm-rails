FactoryGirl.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { ['female', 'male', 'other'].sample }
  end

  factory :matched_student, class: Student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { ['female', 'male', 'other'].sample }
    after(:create) do |student|
      student.tutors << FactoryGirl.create(:tutor)
    end
  end

  factory :enrolled_student, class: Student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { ['female', 'male', 'other'].sample }
    after(:create) do |student|
      student.coordinators << FactoryGirl.create(:coordinator)
    end
  end

  factory :full_student, class: Student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { ['female', 'male', 'other'].sample }
    after(:create) do |student|
      student.tutors << FactoryGirl.create(:tutor)
      student.coordinators << FactoryGirl.create(:coordinator)
    end
  end
end
