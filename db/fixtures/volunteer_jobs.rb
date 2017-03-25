tutors = [*1..100].shuffle

100.times do
  VolunteerJob.seed do |v|
    v.tutor_id = tutors.pop
    v.coordinator_id = rand(13) + 1
    v.start = Date.today
  end
end
