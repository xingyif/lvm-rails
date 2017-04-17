students = [*1..100]

100.times do
  Match.seed do |m|
    student = students.pop
    m.student_id = student
    tutors = Tutor.joins(:volunteer_jobs).where(
      volunteer_jobs: {
        affiliate_id: Student.find(student).active_affiliate.id
      }
    )
    m.tutor_id = tutors.sample.id
    m.start = Date.today
    m.end = Date.today - 1 if [true, false].sample
  end
end
