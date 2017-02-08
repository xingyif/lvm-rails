students = [*1..20].shuffle
tutors = [*1..20].shuffle

15.times do
  Match.seed do |m|
    m.student_id = students.pop
    m.tutor_id = tutors.pop
    m.start = Date.today
  end
end
