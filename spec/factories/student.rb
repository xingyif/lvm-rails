FactoryGirl.define do
  factory :student do
    name { Faker::Name.name }
  end

  factory :matched_student, class: Student do
    name { Faker::Name.name }
    after(:create) do |student|
      student.tutors << FactoryGirl.create(:tutor)
    end
  end

  factory :enrolled_student, class: Student do
    name { Faker::Name.name }
    after(:create) do |student|
      student.coordinators << FactoryGirl.create(:coordinator)
    end
  end

  factory :full_student, class: Student do
    name { Faker::Name.name }
    after(:create) do |student|
      student.tutors << FactoryGirl.create(:tutor)
      student.coordinators << FactoryGirl.create(:coordinator)
    end
  end
end
