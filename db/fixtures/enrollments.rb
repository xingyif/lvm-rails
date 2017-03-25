students = [*1..100].shuffle

100.times do
  Enrollment.seed do |e|
    e.student_id = students.pop
    e.coordinator_id = [1, 2].sample
    e.start = Date.today
  end
end
