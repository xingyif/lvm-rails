tutors = [*1..20].shuffle
coordinators = [*1..20].shuffle

15.times do
  VolunteerJob.seed do |v|
    v.tutor_id = tutors.pop
    v.coordinator_id = coordinators.pop
    v.start = Date.today
  end
end
