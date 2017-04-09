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
      affiliate = create(:affiliate)
      tutor = create(:tutor)
      create(:volunteer_job, affiliate: affiliate, tutor: tutor)
      create(:enrollment, affiliate: affiliate, student: student)
      create(:match, student: student, tutor: tutor)
    end
  end
end
