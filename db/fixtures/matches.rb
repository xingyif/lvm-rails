students = [*1..20].shuffle

15.times do
  Match.seed do |m|
    m.student_id = students.pop
    m.tutor_id = [1, 2].sample
    m.start = Date.today
  end
end
