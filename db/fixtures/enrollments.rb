students = [*1..20].shuffle
coordinators = [*1..20].shuffle

15.times do
  Enrollment.seed do |e|
    e.student_id = students.pop
    e.coordinator_id = coordinators.pop
    e.start = Date.today
  end
end
