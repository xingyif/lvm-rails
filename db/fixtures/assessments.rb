require 'assessments_helper'

students = [*1..20].shuffle
tutors = [*1..20].shuffle

20.times do
  Assessment.seed do |a|
    a.subject = Faker::Internet.slug('English')
    a.date = Faker::Date.between(10.years.ago, Date.today)
    a.score = Random.rand(100.0).truncate(2)
    a.student_id = students.pop
    a.tutor_id = tutors.pop
  end
end
