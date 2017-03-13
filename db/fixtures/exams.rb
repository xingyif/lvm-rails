require 'exams_helper'

students = [*1..20].shuffle
tutors = [*1..20].shuffle

20.times do
  Exam.seed do |e|
    e.subject = Faker::Internet.slug('English')
    e.exam_date = Faker::Date.between(10.years.ago, Date.today)
    e.score = Random.rand(100.0).truncate(2)
    e.student = students.pop
    e.tutor = tutors.pop
  end
end
