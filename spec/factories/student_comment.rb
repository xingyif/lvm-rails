FactoryGirl.define do
  factory :student_comment do
    content { Faker::HarryPotter.quote.delete("'") }
  end
end
