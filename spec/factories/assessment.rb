FactoryGirl.define do
  factory :assessment do
    subject { AssessmentsHelper.assessment_subject.sample[0] }
    date { Faker::Date.between(10.years.ago, Date.today) }
    score { Faker::Number.number(3) }
  end
end
