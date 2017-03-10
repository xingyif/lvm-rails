FactoryGirl.define do
  factory :exam do
    subject { Faker::Internet.slug('English') }
    exam_date { Faker::Date.between(10.years.ago, Date.today) }
    score { Faker::Number.number(3) }
  end
end
