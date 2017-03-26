FactoryGirl.define do
  factory :exam do
    subject { ExamsHelper.exam_subject.sample[0] }
    exam_date { Faker::Date.between(10.years.ago, Date.today) }
    score { Faker::Number.number(3) }
  end
end
