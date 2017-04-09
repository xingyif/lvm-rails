students = [*1..100].shuffle
affiliates = [*1..10].shuffle

100.times do
  Enrollment.seed do |e|
    e.student_id = students.pop
    e.affiliate_id = affiliates.sample
    e.start = Date.today
  end
end
