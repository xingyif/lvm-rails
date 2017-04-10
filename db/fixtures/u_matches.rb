students = [*1..100]
tutors = [*1..100]

150.times do
  Match.seed do |m|
    m.student_id = students.sample
    m.tutor_id = tutors.sample
    m.start = Date.today
    m.end = Date.today - 1 if [true, false].sample
  end
end
